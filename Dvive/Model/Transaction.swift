//
//  Transaction.swift
//  Dvive
//
//  Created by BS01550 on 28/8/24.
//

import Foundation

class Transaction {
    let icon: String?
    let header: String?
    let footer: String?
    let amountHeader: String?
    let amountFooter: String?
    let transactionType: String?
    let currencyType: String?
    
    init(icon: String?, header: String?, footer: String?, amountHeader: String?, amountFooter: String?, transactionType: String?, currencyType: String?) {
        self.icon = icon
        self.header = header
        self.footer = footer
        self.amountHeader = amountHeader
        self.amountFooter = amountFooter
        self.transactionType = transactionType
        self.currencyType = currencyType
    }
}

var listOfTransactions: [Transaction] = [
    Transaction(icon: "ic_add_money", header: "Added to your CAD balance", footer: "Today", amountHeader: "500000000000", amountFooter: "", transactionType: "credit", currencyType: "CAD"),
    Transaction(icon: "ic_receive_money", header: "Md Faiz", footer: "Sent from CAD, Yesterday", amountHeader: "140", amountFooter: "", transactionType: "debit", currencyType: "CAD"),
    Transaction(icon: "ic_card_payment", header: "www.emirates.com", footer: "Card payment, 10 May 2024", amountHeader: "749", amountFooter: "", transactionType: "debit", currencyType: "CAD")
]
