//
//  ExViewCont.swift
//  CryptoPocket
//
//  Created by Вадим Игнатенко on 14.03.25.
//

import UIKit

extension UIViewController {
    
    // Показываем индикатор загрузки
    func showActivityIndicator() {
        let activityIndicatorView = UIActivityIndicatorView(style: .large)
        activityIndicatorView.startAnimating()
        activityIndicatorView.center = view.center
        view.addSubview(activityIndicatorView)
    }
    
    // Убираем индикатор загрузки
    func hideActivityIndicator() {
        view.subviews.forEach { activityIndicatorView in
            if activityIndicatorView is UIActivityIndicatorView { activityIndicatorView.removeFromSuperview() }
        }
    }
    
    // Выбор стрелки и цвета
    func showChevron(procent: Double?) -> (UIImage, UIColor) {
        guard let procent,
              let img = procent < 0 ? UIImage(systemName: "chevron.down") : UIImage(systemName: "chevron.up"),
              let color: UIColor = procent < 0 ? .red : .green else { return (UIImage(), .systemBackground) }
        return (img, color)
    }
}
