//
//  AccountCentre.swift
//  Dvive
//
//  Created by BS01550 on 28/8/24.
//

import Foundation

class AccountCentre{
    let accountType: String?
    let currencyIcon: String?
    let description: String?
    let rightIcon: String?
    
    init(accountType: String?, currencyIcon: String?, description: String?, rightIcon: String?) {
        self.accountType = accountType
        self.currencyIcon = currencyIcon
        self.description = description
        self.rightIcon = rightIcon
    }
}

let listOfAccounts: [AccountCentre] = [
    AccountCentre(accountType: "Canadian Dollar", currencyIcon: "CANADA", description: "Account number, Institution number, Transit number", rightIcon: "ic_caret_right"),
    AccountCentre(accountType: "British Pound", currencyIcon: "BRITAIN", description: "Account number, Sort code, Transit number", rightIcon: "ic_caret_right")
]
