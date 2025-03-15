//
//  DetailVC.swift
//  CryptoPocket
//
//  Created by Вадим Игнатенко on 11.03.25.
//

import UIKit

final class DetailVC: UIViewController {
    
    // MARK: - PROPERTIES
    let viewModel: DetailVM
    private let leftNavBarButton = UIButton()
    private let labelPrice = UILabel()
    private let labelRate = UILabel()
    private let imageRate = UIImageView()
    private let descriptionTableView = UITableView()
    private let collectionTimelineView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 68, height: 48)
        return UICollectionView(frame: .zero, collectionViewLayout: layout)
    }()
    var statusTimeline: [Bool] = [ true, false,  false,  false, false ]
    
    
    // MARK: - LIFE CIRCLE
    
    init(viewModel: DetailVM) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        addViews()
        addSettingsViews()
    }
    
    // MARK: - METHODS
    
    private func setupUI() {
        view.backgroundColor = UIColor(hex: "#F3F5F6")
        navigationItem.title = "\(viewModel.coin.data.name) (\(viewModel.coin.data.symbol))"
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: leftNavBarButton)
    }
    
    private func addViews() {
        view.addSubview(labelPrice)
        view.addSubview(labelRate)
        view.addSubview(imageRate)
        view.addSubview(collectionTimelineView)
        view.addSubview(descriptionTableView)
    }
    
    private func addSettingsViews() {
        settingsForLabelPrice()
        settingsForLabelRate()
        settingsForimageRate()
        settingsForCollectionTimelineView()
        settingsDescriptionTableView()
        settingsLeftNavBarButton()
    }
    
    // MARK: Setting Views
    private func settingsLeftNavBarButton() {
        leftNavBarButton.frame = CGRect(x: 0, y: 0, width: 48, height: 48)
        leftNavBarButton.layer.cornerRadius = 24
        leftNavBarButton.setImage(UIImage(systemName: "arrow.left"), for: .normal)
        leftNavBarButton.tintColor = .black
        leftNavBarButton.backgroundColor = .white
        leftNavBarButton.addTarget(self, action: #selector(backAction), for: .touchUpInside)
    }
    
    private func settingsForLabelPrice() {
        labelPrice.text = "$\(String(format: "%.2f", viewModel.coin.data.marketData.priceUsd))"
        labelPrice.font = .systemFont(ofSize: 28, weight: .bold)
        labelPrice.textColor = .black
        labelPrice.textAlignment = .center
        labelPrice.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            labelPrice.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            labelPrice.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0)
        ])
    }
    
    private func settingsForLabelRate() {
        labelRate.text = "\(String(format: "%.1f", viewModel.coin.data.marketData.percentChangeUsdLast24Hours))%"
        labelRate.font = .systemFont(ofSize: 14, weight: .medium)
        labelRate.textColor = .gray
        labelRate.textAlignment = .center
        labelRate.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            labelRate.topAnchor.constraint(equalTo: labelPrice.topAnchor, constant: 40),
            labelRate.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0)
        ])
    }
    
    private func settingsForimageRate() {
        imageRate.image = showChevron(procent: viewModel.coin.data.marketData.percentChangeUsdLast24Hours).0
        imageRate.tintColor = showChevron(procent: viewModel.coin.data.marketData.percentChangeUsdLast24Hours).1
        imageRate.frame = CGRect(origin: .zero, size: CGSize(width: 5, height: 5))
        imageRate.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageRate.topAnchor.constraint(equalTo: labelPrice.topAnchor, constant: 40),
            imageRate.trailingAnchor.constraint(equalTo: labelRate.trailingAnchor, constant: -40)
        ])
    }
    

    private func settingsForCollectionTimelineView() {
        collectionTimelineView.dataSource = self
        collectionTimelineView.delegate = self
        collectionTimelineView.register(TimelineCollectionCell.self, forCellWithReuseIdentifier: "DetailCollectionCell")
        collectionTimelineView.backgroundColor = UIColor(hex: "#EBEFF1")
        collectionTimelineView.layer.cornerRadius = 30
        collectionTimelineView.isScrollEnabled = false
        collectionTimelineView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionTimelineView.topAnchor.constraint(equalTo: labelRate.topAnchor, constant: 40),
            collectionTimelineView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            collectionTimelineView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            collectionTimelineView.heightAnchor.constraint(equalToConstant: 56)
        ])
    }
    
    private func settingsDescriptionTableView() {
        descriptionTableView.dataSource = self
        descriptionTableView.delegate = self
        descriptionTableView.register(UITableViewCell.self, forCellReuseIdentifier: "DetailTableCell")
        descriptionTableView.estimatedSectionHeaderHeight = 30
        descriptionTableView.separatorStyle = .none
        descriptionTableView.rowHeight = UITableView.automaticDimension
        descriptionTableView.backgroundColor = .white
        descriptionTableView.layer.cornerRadius = 40
        descriptionTableView.translatesAutoresizingMaskIntoConstraints = false
        descriptionTableView.allowsSelection = false
        descriptionTableView.isScrollEnabled = false
        NSLayoutConstraint.activate([
            descriptionTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            descriptionTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            descriptionTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            descriptionTableView.heightAnchor.constraint(equalToConstant: 242)
        ])
    }
    
    @objc private func backAction() {
        navigationController?.popViewController(animated: true)
    }
}
