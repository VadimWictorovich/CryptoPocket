//
//  UserAuthVC.swift
//  CryptoPocket
//
//  Created by Вадим Игнатенко on 11.03.25.
//

import UIKit

final class UserAuthVC: UIViewController {
    
    // MARK: - PROPERTIES
        
    private let logo: UIImageView = {
        let img = UIImageView(image: UIImage(named: "logo"))
        img.contentMode = .scaleAspectFit
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    private let usernameTF: UITextField = {
        let tf = UITextField()
        tf.textColor = .black
        tf.backgroundColor = .white
        tf.layer.cornerRadius = 25
        tf.translatesAutoresizingMaskIntoConstraints = false
        let placeholderColor = UIColor(hex: "#9395A4")
        let placeholderText = NSAttributedString(string: "    Username", attributes: [NSAttributedString.Key.foregroundColor: placeholderColor])
        tf.attributedPlaceholder = placeholderText
        tf.leftView = UIImageView(image: UIImage(named: "imgUser"))
        tf.leftViewMode = .always
        return tf
    }()
    
    private let passwordTF: UITextField = {
        let tf = UITextField()
        tf.textColor = .black
        tf.backgroundColor = .white
        tf.layer.cornerRadius = 25
        tf.translatesAutoresizingMaskIntoConstraints = false
        let placeholderColor = UIColor(hex: "#9395A4")
        let placeholderText = NSAttributedString(string: "    Password", attributes: [NSAttributedString.Key.foregroundColor: placeholderColor])
        tf.attributedPlaceholder = placeholderText
        tf.leftView = UIImageView(image: UIImage(named: "imgPassword"))
        tf.leftViewMode = .always
        return tf
    }()
    
    private let loginButton: UIButton = {
        let but = UIButton()
        but.setTitle("Login", for: .normal)
        but.setTitleColor(.white, for: .normal)
        but.backgroundColor = UIColor(hex: "#191C32")
        but.layer.cornerRadius = 25
        but.addTarget(nil, action: #selector(loginTapped), for: .touchUpInside)
        but.translatesAutoresizingMaskIntoConstraints = false
        return but
    }()
    
    
    // MARK: - LIFE CIRCLE
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupConstrainsts()
    }
    
    // MARK: - METHODS
    
    private func setupUI() {
        view.backgroundColor = UIColor(hex: "#F3F5F6")
        view.addSubview(logo)
        view.addSubview(usernameTF)
        view.addSubview(passwordTF)
        view.addSubview(loginButton)
    }
    
    private func setupConstrainsts() {
        NSLayoutConstraint.activate([
            // logo
            logo.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: -13),
            logo.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 44),
            logo.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -44),
            logo.heightAnchor.constraint(equalTo: logo.widthAnchor, multiplier: 1.0),
            // usernameTF
            usernameTF.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 474),
            usernameTF.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            usernameTF.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            usernameTF.heightAnchor.constraint(equalToConstant: 55),
            usernameTF.widthAnchor.constraint(equalToConstant: 325),
            // passwordTF
            passwordTF.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 544),
            passwordTF.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            passwordTF.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            passwordTF.heightAnchor.constraint(equalToConstant: 55),
            passwordTF.widthAnchor.constraint(equalToConstant: 325),
            // loginButton
            loginButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 624),
            loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            loginButton.heightAnchor.constraint(equalToConstant: 55),
            loginButton.widthAnchor.constraint(equalToConstant: 325)
        ])
    }
    
    @objc private func loginTapped() {
        let vc = HomeVC()
        navigationController?.pushViewController(vc, animated: true)
        vc.showActivityIndicator()
    }
}


