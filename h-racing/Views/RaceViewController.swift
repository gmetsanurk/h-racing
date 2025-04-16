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
        //setupUI()
    }
}

extension RaceViewController {
    
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
    
}
