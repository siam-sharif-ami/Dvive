//
//  transactionTableViewCell.swift
//  Dvive
//
//  Created by BS01550 on 28/8/24.
//

import UIKit

class transactionTableViewCell: UITableViewCell {

    @IBOutlet weak var balanceFooter: UILabel!
    @IBOutlet weak var balanceHeader: UILabel!
    @IBOutlet weak var transactionTrailer: UILabel!
    @IBOutlet weak var transactionHeader: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
