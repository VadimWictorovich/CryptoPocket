//
//  CoinCell.swift
//  CryptoPocket
//
//  Created by Вадим Игнатенко on 12.03.25.
//

import UIKit

final class CoinCell: UITableViewCell {
    
    // MARK: - PROPERTIES
    
    private let imageCoin = UIImageView()
    private let labelNameCoin = UILabel()
    private let labelShortNameCoin = UILabel()
    private let labelPriceCoin = UILabel()
    private let labelRate = UILabel()
    private var imageRate = UIImageView()

    // MARK: - LIFE CIRCLE

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .clear
        addViews()
        setupimageCoin()
        setupLabelNameCoin()
        setupLabelShortNameCoin()
        setupLabelPriceCoin()
        setupLabelRate()
        setupImageRate()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addViews() {
        contentView.addSubview(imageCoin)
        contentView.addSubview(labelNameCoin)
        contentView.addSubview(labelShortNameCoin)
        contentView.addSubview(labelPriceCoin)
        contentView.addSubview(labelRate)
        contentView.addSubview(imageRate)
    }
    
    private func setupimageCoin() {
        imageCoin.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        imageCoin.contentMode = .scaleAspectFit
        imageCoin.tintColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        imageCoin.layer.cornerRadius = 25
        imageCoin.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageCoin.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 25),
            imageCoin.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 0),
            imageCoin.widthAnchor.constraint(equalToConstant: 50),
            imageCoin.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func setupLabelNameCoin() {
        labelNameCoin.font = .systemFont(ofSize: 18, weight: .medium)
        labelNameCoin.textColor = .black
        labelNameCoin.textAlignment = .left
        labelNameCoin.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            labelNameCoin.leadingAnchor.constraint(equalTo: imageCoin.leadingAnchor, constant: 70),
            labelNameCoin.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: -11.5)
        ])
    }
    
    private func setupLabelShortNameCoin() {
        labelShortNameCoin.font = .systemFont(ofSize: 14, weight: .medium)
        labelShortNameCoin.textColor = .gray
        labelShortNameCoin.textAlignment = .left
        labelShortNameCoin.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            labelShortNameCoin.leadingAnchor.constraint(equalTo: imageCoin.leadingAnchor, constant: 70),
            labelShortNameCoin.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 15.5)
        ])
    }
    
    private func setupLabelPriceCoin() {
        labelPriceCoin.font = .systemFont(ofSize: 18, weight: .medium)
        labelPriceCoin.textColor = .black
        labelPriceCoin.textAlignment = .right
        labelPriceCoin.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            labelPriceCoin.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -25),
            labelPriceCoin.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: -11.5)
        ])
    }
    
    private func setupLabelRate() {
        labelRate.font = .systemFont(ofSize: 14, weight: .medium)
        labelRate.textColor = .gray
        labelRate.textAlignment = .right
        labelRate.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            labelRate.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -25),
            labelRate.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 15.5)
        ])
    }
    
    private func setupImageRate() {
//        imageRate.image = UIImage(systemName:"chevron.up")
//        imageRate.tintColor = .green
        imageRate.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageRate.trailingAnchor.constraint(equalTo: labelRate.trailingAnchor, constant: -45),
            imageRate.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 15.5),
            imageRate.widthAnchor.constraint(equalToConstant: 15),
            imageRate.heightAnchor.constraint(equalToConstant: 15)
        ])
    }
    
    func configure(image: UIImage? = UIImage(systemName: "bitcoinsign.circle"), name: String?, shortName: String?, price: String?, rate: String?, imgRate: UIImage?, colorImgRate: UIColor?) {
        imageCoin.image = image
        labelNameCoin.text = name
        labelShortNameCoin.text = shortName
        labelPriceCoin.text = price
        labelRate.text = rate
        imageRate.image = imgRate
        imageRate.tintColor = colorImgRate
    }
}
