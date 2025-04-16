//
//  HomeTabBarController.swift
//  h-racing
//
//  Created by Georgy on 2025-04-16.
//
import UIKit

class HomeTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let raceVC = RaceViewController()
        raceVC.title = "Races"
        raceVC.tabBarItem = UITabBarItem(title: "Races", image: nil, selectedImage: nil)
        
        let historyVC = HistoryViewController()
        historyVC.title = "History"
        historyVC.tabBarItem = UITabBarItem(title: "History", image: nil, selectedImage: nil)
        
        let raceNav = UINavigationController(rootViewController: raceVC)
        let historyNav = UINavigationController(rootViewController: historyVC)
        
        viewControllers = [raceNav, historyNav]
    }
}
