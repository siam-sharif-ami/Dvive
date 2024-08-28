//
//  accountCentreTableViewCell.swift
//  Dvive
//
//  Created by BS01550 on 28/8/24.
//

import UIKit

class accountCentreTableViewCell: UITableViewCell {

    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var rightIcon: UIImageView!
    @IBOutlet weak var titleFooter: UILabel!
    @IBOutlet weak var titleHeader: UILabel!
    @IBOutlet weak var iconImageView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        iconImageView.layer.cornerRadius = iconImageView.frame.width / 2.0
        iconImageView.layer.masksToBounds = true
        iconImageView.clipsToBounds = true
    }
    
}
