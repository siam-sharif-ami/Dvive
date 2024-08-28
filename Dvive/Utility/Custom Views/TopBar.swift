//
//  TopBar.swift
//  Dvive
//
//  Created by BS01550 on 27/8/24.
//

import Foundation
import UIKit

class TopBar: UIView {
    private static let NIB_Name = "TopBar"
    
    
    @IBOutlet weak var view: UIView!
    
    @IBOutlet weak var avatarView: UIView!
    
    @IBOutlet weak var alertView: UIView!
    
    @IBOutlet weak var titleName: UILabel!
    override func awakeFromNib() {
        initWithNib()
        
    }
    
    private func initWithNib() {
        Bundle.main.loadNibNamed(TopBar.NIB_Name, owner: self, options: nil)
        view?.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        setupLayout()
        applyCustomization()
        
        
        
    }
    func applyCustomization(){
        avatarView.layer.cornerRadius = avatarView.frame.width / 2
        titleName.font = UIFont(name: Fonts.Ubuntu.medium, size: getFontSizeWithRespectToDevice(minimumFontSize: 20))
    }
    func setupLayout(){
        NSLayoutConstraint.activate([
            view.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            view.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            view.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
