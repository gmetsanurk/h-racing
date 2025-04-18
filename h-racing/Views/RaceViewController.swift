//
//  RaceViewController.swift
//  h-racing
//
//  Created by Georgy on 2025-04-16.
//

import UIKit

class RaceViewController: UIViewController {
    
    var horseViews: [UIView] = []
    let horseCount = 5
    
    var presenter: RacePresenter!
    
    let startButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Start", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: AppGeometry.buttonFontSize, weight: .bold)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let resetButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Restart", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: AppGeometry.buttonFontSize, weight: .bold)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isHidden = true
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = AppColors.backgroundColor
        presenter = RacePresenter(view: self)
        setupUI()
        setupHorses()
    }
}

extension RaceViewController: RaceViewProtocol {
    
    func setupUI() {
        view.addSubview(startButton)
        view.addSubview(resetButton)
        
        startButton.addTarget(self, action: #selector(startButtonTapped), for: .touchUpInside)
        resetButton.addTarget(self, action: #selector(resetButtonTapped), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            startButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: AppGeometry.buttonTopOffset),
            startButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            resetButton.topAnchor.constraint(equalTo: startButton.bottomAnchor, constant: AppGeometry.buttonSpacing),
            resetButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    func setupHorses() {
        horseViews.forEach { $0.removeFromSuperview() }
        horseViews.removeAll()
        
        for i in 0..<presenter.horseCount {
            let horseView = UIView()
            horseView.backgroundColor = randomColor()
            horseView.layer.cornerRadius = AppGeometry.horseCornerRadius
            horseView.frame = CGRect(
                x: AppGeometry.horseLeading,
                y: AppGeometry.horseTopOffset + CGFloat(i) * (AppGeometry.horseHeight + AppGeometry.horseSpacing),
                width: AppGeometry.horseWidth,
                height: AppGeometry.horseHeight
            )
            view.addSubview(horseView)
            horseViews.append(horseView)
        }
    }
    
    func randomColor() -> UIColor {
        return UIColor(red: CGFloat.random(in: 0.3...1.0),
                       green: CGFloat.random(in: 0.3...1.0),
                       blue: CGFloat.random(in: 0.3...1.0),
                       alpha: 1.0)
    }
    
    @objc func startButtonTapped() {
        presenter.startRace()
    }
    
    @objc func resetButtonTapped() {
        presenter.resetRace()
    }
    
    
    func setStartButtonEnabled(_ enabled: Bool) {
        startButton.isEnabled = enabled
    }
    
    func setResetButtonHidden(_ hidden: Bool) {
        resetButton.isHidden = hidden
    }
    
    func resetHorses() {
        setupHorses()
    }
    
    func animateHorse(at index: Int, duration: TimeInterval, finishLineX: CGFloat, completion: @escaping () -> Void) {
        guard index < horseViews.count else { return }
        let horseView = horseViews[index]
        horseView.frame.origin.x = 20
        UIView.animate(withDuration: duration, delay: 0, options: .curveLinear, animations: {
            horseView.frame.origin.x = finishLineX
        }, completion: { finished in
            if finished {
                completion()
            }
        })
    }
    
    func showFinishAlert(with finishOrder: [Int]) {
        let orderString = finishOrder.map { "Horse \($0)" }.joined(separator: ", ")
        let alert = UIAlertController(title: "Finish!", message: "Finish order: \(orderString)", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
}
