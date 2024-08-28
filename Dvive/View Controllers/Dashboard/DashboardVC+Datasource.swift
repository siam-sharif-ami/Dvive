//
//  DashboardVC+Datasource.swift
//  Dvive
//
//  Created by BS01550 on 27/8/24.
//

import Foundation
import UIKit

extension DashboardVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        currencies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if currencies[indexPath.row].amount == "Add Account" {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "addCurrencyCollectionViewCell", for: indexPath) as? addCurrencyCollectionViewCell else { return UICollectionViewCell.init() }
            cell.amount.text = "Add Account"
            cell.currencyType.text = "20+ currencie"
            cell.setNeedsLayout()
            cell.layoutIfNeeded()
            return cell
        }else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CurrencyCollectionViewCell", for: indexPath) as? CurrencyCollectionViewCell else { return UICollectionViewCell.init() }
            cell.amount.text = currencies[indexPath.row].amount?.withComma()
            cell.iconImageView.image = UIImage(named: currencies[indexPath.row].icon ?? " ")
            cell.currencyType.text = currencies[indexPath.row].currencyType
            cell.setNeedsLayout()
            cell.layoutIfNeeded()
            return cell
        }
    }
    
    
}

extension DashboardVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listOfTransactions.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "transactionTableViewCell", for: indexPath) as? transactionTableViewCell else { return UITableViewCell.init() }
        cell.iconImageView.image = UIImage(named:listOfTransactions[indexPath.row].icon ?? "")
        cell.balanceHeader.attributedText = Helper().getAmountWithBaselineOffset(text: listOfTransactions[indexPath.row].amountHeader ?? "", transactionType: listOfTransactions[indexPath.row].transactionType ?? "", currencyType: listOfTransactions[indexPath.row].currencyType ?? "")
        cell.transactionHeader.text = listOfTransactions[indexPath.row].header
        cell.transactionTrailer.text = listOfTransactions[indexPath.row].footer
        
        if listOfTransactions[indexPath.row].transactionType == "debit"{
            cell.balanceHeader.textColor = Helper().customOrangeColor
        }else {
            cell.balanceHeader.textColor = .systemGreen
        }
        return cell
    }
}
