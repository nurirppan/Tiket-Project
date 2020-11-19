//
//  ButtonTitleCell.swift
//  Tiket Project
//
//  Created by Nur Irfan Pangestu on 19/11/20.
//

import UIKit

class ButtonTitleCell: UITableViewCell {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var labelTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        containerView.layer.cornerRadius = 4
        containerView.clipsToBounds = true
    }
    
    var models: String! {
        didSet {
            self.labelTitle.text = models
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
