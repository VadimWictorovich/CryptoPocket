//
//  HomeVC.swift
//  CryptoPocket
//
//  Created by Вадим Игнатенко on 11.03.25.
//

import UIKit

class HomeVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    private let homeLabel: UILabel = {
        let lab = UILabel()
        lab.text = "Home"
        lab.textColor = .white
        lab.font = .boldSystemFont(ofSize: 34)
        lab.textAlignment = .left
        lab.numberOfLines = 0
        return lab
    }()
    
    private let rightBarButton: UIBarButtonItem = {
        let but = UIBarButtonItem(image: UIImage(systemName: "ellipsis"), style: .plain, target: nil, action: nil)
        but.tintColor = .black
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
        /*
         let image0 = UIImage(named: "Object 1.png")?.cgImage
         let layer0 = CALayer()
         layer0.contents = image0
         layer0.bounds = view.bounds
         layer0.position = view.center
         view.layer.addSublayer(layer0)
         
         view.widthAnchor.constraint(equalToConstant: 242).isActive = true
         view.heightAnchor.constraint(equalToConstant: 242).isActive = true
         view.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: 189).isActive = true
         view.topAnchor.constraint(equalTo: parent.topAnchor, constant: 101).isActive = true
         */
    }()
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.layer.backgroundColor = UIColor(red: 0.967, green: 0.97, blue: 0.979, alpha: 1).cgColor
        tableView.layer.cornerRadius = 40
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupTableView()
        setupConstraints()
    }
    
    
    private func setupUI() {
        view.backgroundColor = UIColor(hex: "#FF9AB2")
//        navigationItem.title = "Home"
//        navigationItem.largeTitleDisplayMode = .always
//        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: homeLabel)
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "ellipsis"), style: .plain, target: nil, action: nil)

        navigationController?.navigationBar.largeTitleTextAttributes = [ NSAttributedString.Key.foregroundColor: UIColor.white]
        
        
        view.addSubview(affiliateProgramLabel)
        view.addSubview(learnMoreButton)
        view.addSubview(imageFromBackground)
        view.addSubview(tableView)
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
    
    // TableView data sorcce and delegate methods
    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(CoinCell.self, forCellReuseIdentifier: "CoinCell")
        tableView.separatorStyle = .none
        tableView.rowHeight = UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        CoinCell()
    }
}


