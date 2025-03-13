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

extension DetailVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let sections = DetailItems.allCases
        return sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DetailCollectionCell", for: indexPath) as? TimelineCollectionCell else { return UICollectionViewCell() }
        let buttons = DetailItems.allCases
        let button = buttons[indexPath.row]
        cell.configure(label: button.rawValue)
        return cell
    }
}


