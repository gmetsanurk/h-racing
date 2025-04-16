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
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    let resetButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Restart", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isHidden = true
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
    }
}

extension RaceViewController: RaceViewProtocol {
    
    func setupUI() {
            view.addSubview(startButton)
            view.addSubview(resetButton)
            
            startButton.addTarget(self, action: #selector(startButtonTapped), for: .touchUpInside)
            resetButton.addTarget(self, action: #selector(resetButtonTapped), for: .touchUpInside)
            
            NSLayoutConstraint.activate([
                startButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
                startButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                
                resetButton.topAnchor.constraint(equalTo: startButton.bottomAnchor, constant: 20),
                resetButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            ])
        }
    
    func setupHorses() {
        for horse in horseViews {
            horse.removeFromSuperview()
        }
        horseViews.removeAll()
        
        let horseWidth: CGFloat = 50
        let horseHeight: CGFloat = 30
        let spacing: CGFloat = 20
        
        for i in 0..<horseCount {
            let horseView = UIView()
            horseView.backgroundColor = randomColor()
            horseView.frame = CGRect(x: 20, y: 150 + CGFloat(i) * (horseHeight + spacing), width: horseWidth, height: horseHeight)
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
