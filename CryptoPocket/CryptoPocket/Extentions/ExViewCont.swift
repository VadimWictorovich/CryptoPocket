//
//  ExViewCont.swift
//  CryptoPocket
//
//  Created by Вадим Игнатенко on 14.03.25.
//

import UIKit

extension UIViewController {
    
    func showActivityIndicator() {
        let activityIndicatorView = UIActivityIndicatorView(style: .large)
        activityIndicatorView.startAnimating()
        activityIndicatorView.center = view.center
        view.addSubview(activityIndicatorView)
    }
    
    func hideActivityIndicator() {
        view.subviews.forEach { activityIndicatorView in
            if activityIndicatorView is UIActivityIndicatorView { activityIndicatorView.removeFromSuperview() }
        }
    }
}
