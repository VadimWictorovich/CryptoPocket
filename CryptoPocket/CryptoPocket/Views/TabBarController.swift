//
//  TabBarController.swift
//  CryptoPocket
//
//  Created by Вадим Игнатенко on 16.03.25.
//

import UIKit

final class TabBarController: UITabBarController {
    
    private let firstVC = UINavigationController(rootViewController: HomeVC())
    private let secondVC = UIViewController()
    private let thirdVC = UIViewController()
    private let fourthVC = UIViewController()
    private let fifthVC = UIViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        settingsControllers()
    }
    
    private func setupUI() {
        self.viewControllers = [firstVC, secondVC, thirdVC, fourthVC, fifthVC]
        self.tabBar.isTranslucent = false
        self.tabBar.tintColor = .black
        self.tabBar.unselectedItemTintColor = .gray
        self.tabBar.backgroundColor = .white
    }
    
    private func settingsControllers() { // tab1
        firstVC.tabBarItem.image = UIImage(named: "tab1")
        secondVC.tabBarItem.image = UIImage(named: "tab2")
        thirdVC.tabBarItem.image = UIImage(named: "tab3")
        fourthVC.tabBarItem.image = UIImage(named: "tab4")
        fifthVC.tabBarItem.image = UIImage(named: "tab5")
    }
}
