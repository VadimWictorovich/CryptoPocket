//
//  ExTabBar.swift
//  CryptoPocket
//
//  Created by Вадим Игнатенко on 16.03.25.
//

import UIKit

extension HomeVC {
    func setupTabBar() {
        // Создаем 5 контроллеров для таббара
        let firstVC = UIViewController()
        firstVC.view.backgroundColor = .white
        firstVC.tabBarItem = UITabBarItem(title: "Главная", image: UIImage(systemName: "house"), tag: 0)

        let secondVC = UIViewController()
        secondVC.view.backgroundColor = .white
        secondVC.tabBarItem = UITabBarItem(title: "Поиск", image: UIImage(systemName: "magnifyingglass"), tag: 1)

        let thirdVC = UIViewController()
        thirdVC.view.backgroundColor = .white
        thirdVC.tabBarItem = UITabBarItem(title: "Избранное", image: UIImage(systemName: "heart"), tag: 2)

        let fourthVC = UIViewController()
        fourthVC.view.backgroundColor = .white
        fourthVC.tabBarItem = UITabBarItem(title: "Уведомления", image: UIImage(systemName: "bell"), tag: 3)

        let fifthVC = UIViewController()
        fifthVC.view.backgroundColor = .white
        fifthVC.tabBarItem = UITabBarItem(title: "Профиль", image: UIImage(systemName: "person"), tag: 4)

        // Обернем каждый контроллер в UINavigationController
        let firstNav = UINavigationController(rootViewController: firstVC)
        let secondNav = UINavigationController(rootViewController: secondVC)
        let thirdNav = UINavigationController(rootViewController: thirdVC)
        let fourthNav = UINavigationController(rootViewController: fourthVC)
        let fifthNav = UINavigationController(rootViewController: fifthVC)

        // Создаем TabBarController и добавляем контроллеры
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [firstNav, secondNav, thirdNav, fourthNav, fifthNav]

        // Настройка внешнего вида таббара
        tabBarController.tabBar.tintColor = .systemBlue
        tabBarController.tabBar.unselectedItemTintColor = .gray
        tabBarController.tabBar.backgroundColor = .white

        // Устанавливаем TabBarController как корневой контроллер
        addChild(tabBarController)
        view.addSubview(tabBarController.view)
        tabBarController.didMove(toParent: self)
        
    }
}
