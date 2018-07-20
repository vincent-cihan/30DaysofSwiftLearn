//
//  ArtistTableViewCell.swift
//  Day15 - SizingTableViewCell
//
//  Created by 刘乙灏 on 2018/7/20.
//  Copyright © 2018年 刘乙灏. All rights reserved.
//

import UIKit

class ArtistTableViewCell: UITableViewCell {

    @IBOutlet weak var bioLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var artistImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.nameLabel.textColor = UIColor.white
        self.nameLabel.backgroundColor = UIColor(red: 1, green: 152 / 255, blue: 0, alpha: 1)
        self.nameLabel.layer.cornerRadius = 3
        self.nameLabel.clipsToBounds = true
        self.bioLabel.textColor = UIColor(white: 114/255, alpha: 1)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
