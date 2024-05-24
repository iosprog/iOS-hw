//
//  TableViewCell.swift
//  WorldWonders
//
//  Created by РАХАТ  on 09.01.2024.
//

import UIKit
import SDWebImage

class TableViewCell: UITableViewCell {

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var regionLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var flagView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setData(wonder: WorldWonder) {
        nameLabel.text = wonder.name
        regionLabel.text = wonder.region
        locationLabel.text = wonder.location
        imgView.sd_setImage(with: URL(string: wonder.picture), completed: nil)
        flagView.sd_setImage(with: URL(string: wonder.flag), completed: nil)
    }

}
