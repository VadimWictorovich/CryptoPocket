//
//  ExtHomeForTable.swift
//  CryptoPocket
//
//  Created by Вадим Игнатенко on 14.03.25.
//

import UIKit

extension HomeVC: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int { 1 }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat { 50 }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let sView = UIView()
        let label = UILabel()
        let filtButton = UIButton()
        sView.addSubview(label)
        sView.addSubview(filtButton)
        settingsForSectionLabel(label: label, superView: sView)
        settingsSortButton(button: filtButton, superView: sView)
        return sView
    }
    
    // MARK: ROWS
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { 1 }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CoinCell", for: indexPath) as? CoinCell else { return UITableViewCell() }
        cell.configure(name: "Bitcoin", shortName: "BTC", price: "$ 43.000", rate: "24 %")
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailVC()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    private func settingsSortButton(button: UIButton, superView: UIView) {
        button.setImage(UIImage(named: "filt"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.trailingAnchor.constraint(equalTo: superView.trailingAnchor, constant: -16),
            button.centerYAnchor.constraint(equalTo: superView.centerYAnchor)
            ])
    }
    
    private func settingsForSectionLabel(label: UILabel, superView: UIView) {
        label.text = "  Trending"
        label.textColor = .black
        label.font = .systemFont(ofSize: 20, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: superView.leadingAnchor, constant: 16),
            label.centerYAnchor.constraint(equalTo: superView.centerYAnchor)
            ])
    }
}
