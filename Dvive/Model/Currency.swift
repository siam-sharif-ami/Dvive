//
//  Currency.swift
//  Dvive
//
//  Created by BS01550 on 27/8/24.
//

import Foundation

class Currency{
    let currencyType: String?
    let amount: String?
    let icon: String?
    
    init(currencyType: String?, amount: String?, icon: String?) {
        self.currencyType = currencyType
        self.amount = amount
        self.icon = icon
    }
    
}

var currencies: [Currency] = [
    Currency(currencyType: "CAD", amount: "3000000", icon: "CANADA"),
    Currency(currencyType: "GBP", amount: "5000000000", icon: "BRITAIN"),
    Currency(currencyType: "20+ currency", amount: "Add Account", icon: "ic_plus")
]
