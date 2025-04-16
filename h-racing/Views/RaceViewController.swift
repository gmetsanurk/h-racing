//
//  RaceViewController.swift
//  h-racing
//
//  Created by Georgy on 2025-04-16.
//

import UIKit

class RaceViewController: UIViewController {
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
