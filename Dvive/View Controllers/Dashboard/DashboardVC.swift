//
//  DashboardVC.swift
//  Dvive
//
//  Created by BS01550 on 27/8/24.
//

import Foundation
import UIKit

class DashboardVC: UIViewController {
    
    @IBOutlet weak var topBarHeightConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var balanceLabel: UILabel!
    @IBOutlet weak var balanceViewHeight: NSLayoutConstraint!
    @IBOutlet weak var currencyCollectionView: UICollectionView!
    
    @IBOutlet weak var currencyCollectionViewHeight: NSLayoutConstraint!
    
    @IBOutlet weak var globalAccountCentreLabel: UILabel!
    @IBOutlet weak var transactionTableView: UITableView!
    @IBOutlet weak var recentTransactionsLabel: UILabel!
    @IBOutlet weak var seeAll: UILabel!
    
    @IBOutlet weak var globalAccountSeeAll: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var transactionTableViewHeight: NSLayoutConstraint!
    
    @IBOutlet weak var accountCentreTableViewHeight: NSLayoutConstraint!
    @IBOutlet weak var accountCentreTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerXibFiles()
        setupDelegatesAndDataSource()
        
        
        print(UIScreen.main.scale)
        setupHeightsConstraints()
        setupFontsAndTextSizes()
        
        self.currencyCollectionView.addObserver(self, forKeyPath: "contentSize", context: nil)
        //self.transactionTableView.addObserver(self, forKeyPath: "contentSize", context: nil)
        self.currencyCollectionView.showsHorizontalScrollIndicator = false
        self.scrollView.showsVerticalScrollIndicator = false
    }
    
    func setupDelegatesAndDataSource(){
        currencyCollectionView.delegate = self
        currencyCollectionView.dataSource = self
        
        transactionTableView.delegate = self
        transactionTableView.dataSource = self
        
        accountCentreTableView.delegate = self
        accountCentreTableView.dataSource = self
        
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        currencyCollectionView.layer.removeAllAnimations()
        transactionTableView.layer.removeAllAnimations()
        accountCentreTableView.layer.removeAllAnimations()
        
        currencyCollectionViewHeight.constant = currencyCollectionView.contentSize.height
        transactionTableViewHeight.constant =
        transactionTableView.contentSize.height
        accountCentreTableViewHeight.constant = accountCentreTableView.contentSize.height
        
        UIView.animate(withDuration: 0.5) {
            self.updateViewConstraints()
        }
//
   }
    
    
    func registerXibFiles(){
        currencyCollectionView.register(UINib(nibName: "CurrencyCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CurrencyCollectionViewCell")
        currencyCollectionView.register(UINib(nibName: "addCurrencyCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "addCurrencyCollectionViewCell")
        
        transactionTableView.register(UINib(nibName: "transactionTableViewCell", bundle: nil), forCellReuseIdentifier: "transactionTableViewCell")
        accountCentreTableView.register(UINib(nibName: "accountCentreTableViewCell", bundle: nil), forCellReuseIdentifier: "accountCentreTableViewCell")
    }
    
    func setupFontsAndTextSizes(){
        balanceLabel.attributedText = Helper().getAmountWithIcon(amount: "113.87 CAD")
        balanceLabel.font = UIFont(name: Fonts.Inter.bold, size: getFontSizeWithRespectToDevice(minimumFontSize: 16))
        recentTransactionsLabel.font = UIFont(name: Fonts.Inter.semiBold, size: 20)
        seeAll.attributedText = Helper().getUnderlinedText(text: "See all")
        seeAll.font = UIFont(name: Fonts.Inter.medium, size: 14)
        seeAll.textColor = Helper().customOrangeColor
        
        globalAccountCentreLabel.font = UIFont(name: Fonts.Inter.semiBold, size: 20)
        globalAccountSeeAll.font = UIFont(name: Fonts.Inter.semiBold, size: 14)
        globalAccountSeeAll.attributedText = Helper().getUnderlinedText(text: "See all")
        globalAccountSeeAll.textColor = Helper().customOrangeColor
    }
    
    func setupHeightsConstraints(){
        topBarHeightConstraint.constant = getContentHeightWithRespectToDevice(contentHeight: 50)
        balanceViewHeight.constant = getContentHeightWithRespectToDevice(contentHeight: 30)
    }
}




