//
//  CollectionExt.swift
//  CryptoPocket
//
//  Created by Вадим Игнатенко on 13.03.25.
//

import UIKit

enum DetailItems: String, CaseIterable {
    case hour = "24H"
    case week = "1W"
    case year = "1Y"
    case all = "ALL"
    case point = "Point"
}

extension DetailVC: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let sections = DetailItems.allCases
        return sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DetailCollectionCell", for: indexPath) as? TimelineCollectionCell else { return UICollectionViewCell() }
        let buttons = DetailItems.allCases
        let button = buttons[indexPath.row]
        let status = statusTimeline[indexPath.row]
        cell.configure(label: button.rawValue, textColor: actionTimeline(isActive: status).1)
        cell.backgroundColor = actionTimeline(isActive: status).0
        cell.layer.cornerRadius = 25
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        chooseBoolValue(chooseItem: indexPath.row)
        collectionView.reloadData()
    }
    
    
    private func actionTimeline(isActive: Bool ) -> (UIColor, UIColor) {
        isActive ? ( UIColor.white, UIColor.black) : ( UIColor(hex: "#EBEFF1")!, UIColor.gray)
    }
    
    private func chooseBoolValue(chooseItem: Int) {
        for val in 0...4 {
            if val != chooseItem {
                statusTimeline[val] = false
            }
        }
        statusTimeline[chooseItem] = true
    }
}

