//
//  UserAuthVC.swift
//  CryptoPocket
//
//  Created by Вадим Игнатенко on 11.03.25.
//

import UIKit

final class UserAuthVC: UIViewController {
    
    // MARK: - PROPERTIES
    private let viewModel = AuthViewModel()
    var loginButtonBottomConstraint: NSLayoutConstraint!
        
    private let logo: UIImageView = {
        let img = UIImageView(image: UIImage(named: "logo"))
        img.contentMode = .scaleAspectFit
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    private let usernameTF: NewTF = {
        let tf = NewTF()
        tf.textColor = .black
        tf.backgroundColor = .white
        tf.layer.cornerRadius = 25
        tf.translatesAutoresizingMaskIntoConstraints = false
        let imageView = UIImageView(image: UIImage(named: "imgUser"))
        let containerView = UIView(frame: CGRect(x: 0, y: 0, width: 32, height: 32))
        imageView.frame = CGRect(x: 10, y: 0, width: 32, height: 32)
        containerView.addSubview(imageView)
        tf.leftView = containerView
        tf.leftViewMode = .always
        let placeholderColor = UIColor(hex: "#9395A4")
        let placeholderText = NSAttributedString(string: "    Username", attributes: [NSAttributedString.Key.foregroundColor: placeholderColor])
        tf.attributedPlaceholder = placeholderText
        return tf
    }()
    
    private let passwordTF: NewTF = {
        let tf = NewTF()
        tf.textColor = .black
        tf.backgroundColor = .white
        tf.layer.cornerRadius = 25
        tf.translatesAutoresizingMaskIntoConstraints = false
        let imageView = UIImageView(image: UIImage(named: "imgPassword"))
        let containerView = UIView(frame: CGRect(x: 0, y: 0, width: 32, height: 32)) // Ширина контейнера
        imageView.frame = CGRect(x: 10, y: 0, width: 32, height: 32) // Отступ слева 10 точек
        containerView.addSubview(imageView)
        tf.leftView = containerView
        tf.leftViewMode = .always
        let placeholderColor = UIColor(hex: "#9395A4")
        let placeholderText = NSAttributedString(string: "    Password", attributes: [NSAttributedString.Key.foregroundColor: placeholderColor])
        tf.attributedPlaceholder = placeholderText
        tf.isSecureTextEntry = true
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
        setupConstraints()
        hideKeyboardWhenTappedAround()
        startKeyboardObserver()
    }
    
    // MARK: - METHODS
    
    private func setupUI() {
        view.backgroundColor = UIColor(hex: "#F3F5F6")
        view.addSubview(logo)
        view.addSubview(usernameTF)
        view.addSubview(passwordTF)
        view.addSubview(loginButton)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            logo.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: -13),
            logo.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 44),
            logo.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -44),
            logo.heightAnchor.constraint(equalTo: logo.widthAnchor, multiplier: 1.0)
        ])
        
        loginButtonBottomConstraint = loginButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -155)
        
        NSLayoutConstraint.activate([
            // usernameTF
            usernameTF.bottomAnchor.constraint(equalTo: passwordTF.topAnchor, constant: -20),
            usernameTF.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            usernameTF.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            usernameTF.heightAnchor.constraint(equalToConstant: 55),
            
            // passwordTF
            passwordTF.bottomAnchor.constraint(equalTo: loginButton.topAnchor, constant: -20),
            passwordTF.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            passwordTF.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            passwordTF.heightAnchor.constraint(equalToConstant: 55),
            
            // loginButton
            loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            loginButton.heightAnchor.constraint(equalToConstant: 55),
            
            loginButtonBottomConstraint
        ])
    }
        
    @objc private func loginTapped() {
        guard let login = usernameTF.text, let password = passwordTF.text, login != "", password != "" else { return }
        if viewModel.login(login: login, password: password) {
            let tabBarController = TabBarController()
            if let window = UIApplication.shared.windows.first {
                window.rootViewController = tabBarController
                window.makeKeyAndVisible()
                UIView.transition(with: window, duration: 0.3, options: .transitionCrossDissolve, animations: nil, completion: nil)
            }
        } else {
            let alert = UIAlertController(title: "Ошибка", message: "Неверный логин или пароль", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            present(alert, animated: true)
        }
    }
}




