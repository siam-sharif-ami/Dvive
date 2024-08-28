//
//  addCurrencyCollectionViewCell.swift
//  Dvive
//
//  Created by BS01550 on 27/8/24.
//

import UIKit

class addCurrencyCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var amount: UILabel!
    @IBOutlet weak var currencyType: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var view: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        setupLayers()
        setupFonts()
    }
    
    func setupLayers(){
        
        view.layer.cornerRadius = getContentHeightWithRespectToDevice(contentHeight: 10)
        
        view.layer.borderWidth = 1.0
        view.layer.borderColor = Helper().borderColor.cgColor
        view.layer.shadowRadius = getContentHeightWithRespectToDevice(contentHeight: 8)
        view.layer.shadowColor = Helper().shadowColor.cgColor
        view.layer.shadowOpacity = 0.4
        view.layer.shadowOffset = CGSize(width: 1.0 , height: getContentHeightWithRespectToDevice(contentHeight: 3))
        
    }
    func setupFonts(){
        amount.font = UIFont(name: Fonts.Inter.medium, size: getFontSizeWithRespectToDevice(minimumFontSize: 14))
        currencyType.font = UIFont(name: Fonts.Inter.regular, size: getFontSizeWithRespectToDevice(minimumFontSize: 12))
    }

}
