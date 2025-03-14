//
//  HomeVC.swift
//  CryptoPocket
//
//  Created by Вадим Игнатенко on 11.03.25.
//

import UIKit

final class HomeVC: UIViewController {

    // MARK: - PROPERTIES
    
    private let tableView = UITableView()
    let viewModel = HomeVM()

    private let homeLabel: UILabel = {
        let lab = UILabel()
        lab.text = "Home"
        lab.textColor = .white
        lab.font = .boldSystemFont(ofSize: 34)
        lab.textAlignment = .left
        lab.numberOfLines = 0
        return lab
    }()
    
    private let rightBarButton: UIButton = {
        let but = UIButton()
        but.frame = CGRect(x: 0, y: 0, width: 48, height: 48)
        but.layer.cornerRadius = 24
        but.setImage(UIImage(systemName: "ellipsis"), for: .normal)
        but.tintColor = .black
        but.layer.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.8).cgColor
        but.showsMenuAsPrimaryAction = true
        return but
    }()
    
    private let affiliateProgramLabel: UILabel = {
        let lab = UILabel()
        lab.text = "Affiliate program"
        lab.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        lab.font = .boldSystemFont(ofSize: 20)
        lab.textAlignment = .left
        lab.numberOfLines = 0
        lab.translatesAutoresizingMaskIntoConstraints = false
        return lab
    }()
    
    private let learnMoreButton: UIButton = {
        let button = UIButton()
        button.setTitle("Learn more", for: .normal)
        button.setTitleColor(UIColor(red: 0.149, green: 0.153, blue: 0.235, alpha: 1), for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 14)
        button.layer.backgroundColor = UIColor(red: 0.98, green: 0.984, blue: 0.984, alpha: 1).cgColor
        button.layer.cornerRadius = 17
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let imageFromBackground: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "bgImg2")
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    // MARK: - LIFE CIRCLE
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateData()
        setupUI()
        addViews()
        settingsViews()
    }
    
    // MARK: - METHODS
    
    private func setupUI() {
        view.backgroundColor = UIColor(hex: "#FF9AB2")
        rightBarButton.menu = showMenuView()
    }
    
    private func addViews() {
        view.addSubview(affiliateProgramLabel)
        view.addSubview(learnMoreButton)
        view.addSubview(imageFromBackground)
        view.addSubview(tableView)
    }
    
    private func settingsViews() {
        setupNavigation()
        setupTableView()
        setupConstraints()
    }
    
    private func setupNavigation() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: homeLabel)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: rightBarButton)
        navigationController?.navigationBar.largeTitleTextAttributes = [ NSAttributedString.Key.foregroundColor: UIColor.white]
    }
    
    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(CoinCell.self, forCellReuseIdentifier: "CoinCell")
        tableView.backgroundColor = .white
        tableView.layer.cornerRadius = 40
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        tableView.rowHeight = UITableView.automaticDimension
        tableView.bounces = false
        tableView.showsVerticalScrollIndicator = false
    }
        
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            // affiliateProgramLabel
            affiliateProgramLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 46),
            affiliateProgramLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            affiliateProgramLabel.widthAnchor.constraint(equalToConstant: 172),
            affiliateProgramLabel.heightAnchor.constraint(equalToConstant: 30),
            // learnMoreButton
            learnMoreButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 88),
            learnMoreButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            learnMoreButton.widthAnchor.constraint(equalToConstant: 127),
            learnMoreButton.heightAnchor.constraint(equalToConstant: 35),
            // imageFromBackground
            imageFromBackground.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 21),
            imageFromBackground.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 39),
            imageFromBackground.widthAnchor.constraint(equalToConstant: 242),
            imageFromBackground.heightAnchor.constraint(equalTo: imageFromBackground.widthAnchor, multiplier: 1.0),
            // tableView
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 178),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        ])
    }
    
    private func showMenuView() -> UIMenu {
        let action1 = UIAction(title: "Обновить", image: UIImage(named: "menu1")) { _ in
            print ("Кнопка обновить")
        }
        let action2 = UIAction(title: "Выйти", image: UIImage(named: "menu2")) { [weak self] _ in
            self?.navigationController?.popToRootViewController(animated: true)
        }
        let menu = UIMenu(title: "", children: [action1, action2])
        return menu
    }
    
    private func updateData() {
        viewModel.getArrayCoins { [weak self] in
            self?.tableView.reloadData()
            self?.hideActivityIndicator()
        }
    }
    
    @objc func sortAction() {
        viewModel.sortCoins(updateList: true)
        tableView.reloadData()
    }
}

