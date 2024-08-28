//
//  Helper.swift
//  Pocket
//
//  Created by BS00484 on 18/8/24.
//

import Foundation
import UIKit

public class Helper: NSObject {
    public lazy var gradientLightGolden: UIColor = hexStringToUIColor(hex: "#F5F1AF")
    public lazy var gradientMidGolden: UIColor = hexStringToUIColor(hex: "#DCC685")
    public lazy var gradientDarkGolden: UIColor = hexStringToUIColor(hex: "#C49F5E")
    public lazy var bottomViewColor: UIColor = hexStringToUIColor(hex: "#F3F3F3")
    public lazy var borderColor: UIColor = hexStringToUIColor(hex: "#E0E3E7")
    public lazy var shadowColor: UIColor = hexStringToUIColor(hex: "#EBECED")
    public lazy var buttonTextColor:UIColor = hexStringToUIColor(hex: "#000000").withAlphaComponent(0.7)
    public lazy var customOrangeColor: UIColor = hexStringToUIColor(hex: "#F48021")
    
    public func hexStringToUIColor (hex: String) -> UIColor {
        var cString: String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if cString.hasPrefix("#") {
            cString.remove(at: cString.startIndex)
        }
        
        if (cString.count) != 6 {
            return UIColor.gray
        }
        
        var rgbValue: UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    public func getAmountWithIcon(amount: String) -> NSAttributedString {
        let attachment = NSTextAttachment()
        let text = amount
        let img = UIImage(named: "ic_info")
        let font = UIFont.systemFont(ofSize: 16)
        
        attachment.image = img
        
        let mid = font.descender + font.capHeight
        let width = getContentHeightWithRespectToDevice(contentHeight: 15)
        let height = getContentHeightWithRespectToDevice(contentHeight: 16)
    
        attachment.bounds = CGRect(x: 0, y: font.descender - height / 2 + mid + 2 , width: width, height: height)
        
        let attachmentString = NSAttributedString(attachment: attachment)
        
        let string = NSMutableAttributedString(string: text + "  " , attributes: [:])
        
        let mutableAttributedString = NSMutableAttributedString()
        mutableAttributedString.append(string)
        mutableAttributedString.append(attachmentString)
        
        return mutableAttributedString
    }
    
    public func getUnderlinedText(text: String)-> NSAttributedString {
        let underLineAttribute = [NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue]
        let underlineAttributedString = NSAttributedString(string: text, attributes: underLineAttribute)
        return underlineAttributedString
    }
    
    public func getAmountWithBaselineOffset(text: String, transactionType: String, currencyType: String) -> NSAttributedString{
        let completeText = NSMutableAttributedString()
        
        if transactionType == "credit" {
            completeText.append(NSAttributedString(string: "+"))
        }else {
            completeText.append(NSAttributedString(string: "-"))
        }
        
        let tempText = text.withComma()
        let parts = text.split(separator: ".")
        let integerPart = String(parts.first ?? "")
        let decimalpart = parts.count > 1 ? String(parts.last!) : "00"
        
        
        completeText.append(NSAttributedString(string: integerPart + "."))
        completeText.append(NSAttributedString(string: decimalpart))
        completeText.append(NSAttributedString(string: " " + currencyType))
        
        return completeText
    }
    
}

public extension String {
    func withComma() -> String {
        var val = ""
        for item in self {
            if item != ","{
                val.append(item)
            }
        }
        let numberFormatter = NumberFormatter()
        numberFormatter.usesGroupingSeparator = true
        numberFormatter.groupingSize = 3
        numberFormatter.numberStyle = .decimal
        numberFormatter.locale = Locale(identifier: "en_US")
        numberFormatter.maximumFractionDigits = 2
        numberFormatter.minimumFractionDigits = 2
        return numberFormatter.string(from: NSNumber(value: Double(val) ?? 0.00))!
    }
}
