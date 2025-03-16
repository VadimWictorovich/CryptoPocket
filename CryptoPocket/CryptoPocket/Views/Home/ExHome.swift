//
//  ExHome.swift
//  CryptoPocket
//
//  Created by Вадим Игнатенко on 14.03.25.
//

import UIKit

extension HomeVC: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int { 1 }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat { 60 }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let sView = UIView()
        let label = UILabel()
        let filtButton = UIButton()
        sView.addSubview(label)
        sView.addSubview(filtButton)
        settingsForSectionLabel(label: label, superView: sView)
        settingsSortButton(button: filtButton, superView: sView)
        sView.backgroundColor = UIColor(hex: "#F7F7FA")
        return sView
    }
    
    // MARK: ROWS
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { viewModel.coins.count }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CoinCell", for: indexPath) as? CoinCell else { return UITableViewCell() }
        let coin = viewModel.coins[indexPath.row]
        cell.selectionStyle = .none
        cell.configure(name: coin.data.name,
                       shortName: coin.data.symbol,
                       price: "$\(String(format: "%.2f", coin.data.marketData.priceUsd))",
                       rate: "\(String(format: "%.1f", coin.data.marketData.percentChangeUsdLast24Hours))%",
                       imgRate: showChevron(procent: coin.data.marketData.percentChangeUsdLast24Hours).0,
                       colorImgRate: showChevron(procent: coin.data.marketData.percentChangeUsdLast24Hours).1 )
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let nextVM = DetailVM(coin: viewModel.coins[indexPath.row])
        let nextVC = DetailVC(viewModel: nextVM)
        navigationController?.pushViewController(nextVC, animated: true)
    }
    
    private func settingsSortButton(button: UIButton, superView: UIView) {
        button.setImage(UIImage(named: "filt"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(sortAction), for: .touchUpInside)
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
