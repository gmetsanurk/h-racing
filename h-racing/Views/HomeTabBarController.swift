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
        view.overrideUserInterfaceStyle = AppColors.styleColor
        let raceVC = RaceViewController()
        raceVC.title = "Races"
        raceVC.tabBarItem = UITabBarItem(title: "Races", image: nil, selectedImage: nil)
        
        let historyVC = HistoryViewController()
        historyVC.title = "History"
        historyVC.tabBarItem = UITabBarItem(title: "History", image: nil, selectedImage: nil)
        
        let raceNav = UINavigationController(rootViewController: raceVC)
        let historyNav = UINavigationController(rootViewController: historyVC)
        
        viewControllers = [raceNav, historyNav]
        let fontAttributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: AppGeometry.buttonFontSize, weight: .bold)]
        UITabBarItem.appearance().setTitleTextAttributes(fontAttributes as [NSAttributedString.Key : Any], for: .normal)
        UITabBarItem.appearance().setTitleTextAttributes(fontAttributes as [NSAttributedString.Key : Any], for: .selected)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        var tabFrame = tabBar.frame
        tabFrame.size.height = AppGeometry.tabBarHeight
    }
}
