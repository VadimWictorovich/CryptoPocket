//
//  TableExt.swift
//  CryptoPocket
//
//  Created by Вадим Игнатенко on 13.03.25.
//

import UIKit

enum DetailRows: String, CaseIterable {
    case marketCapitalization = "Market capitalization"
    case circulatingSuply = "Circulating Suply"
}

extension DetailVC: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int { 1 }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? { "Market Statistic" }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let header = view as? UITableViewHeaderFooterView else { return }
        header.textLabel?.textColor = .black
        header.textLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { 2 }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DetailTableCell", for: indexPath)
        let buttons = DetailRows.allCases
        let but = buttons[indexPath.row]
        cell.textLabel?.text = but.rawValue
        cell.textLabel?.textColor = .gray
        return cell
    }
    
    
}
