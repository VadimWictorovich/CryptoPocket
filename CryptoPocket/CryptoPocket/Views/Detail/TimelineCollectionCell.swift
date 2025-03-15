//
//  TimelineCollectionCell.swift
//  CryptoPocket
//
//  Created by Вадим Игнатенко on 13.03.25.
//

import UIKit

final class TimelineCollectionCell: UICollectionViewCell {
    
    private let labelTime = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        contentView.addSubview(labelTime)
        labelTime.font = .boldSystemFont(ofSize: 14)
        labelTime.textColor = .gray
        labelTime.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            labelTime.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            labelTime.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
    
    func configure(label: String, textColor: UIColor) {
        labelTime.text = label
        labelTime.textColor = textColor
    }
}
