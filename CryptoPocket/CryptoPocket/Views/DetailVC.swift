//
//  DetailVC.swift
//  CryptoPocket
//
//  Created by Вадим Игнатенко on 11.03.25.
//

import UIKit

final class DetailVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        // Do any additional setup after loading the view.
    }
    
    private func setupUI() {
        view.backgroundColor = UIColor(hex: "#F3F5F6")
        navigationItem.title = "Bitcoin (BTC)"
    }
    

}
