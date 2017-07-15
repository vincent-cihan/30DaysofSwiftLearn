//
//  TableViewCell.swift
//  Day11-ClearTableViewCell
//
//  Created by 刘乙灏 on 2017/7/15.
//  Copyright © 2017年 刘乙灏. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    let gradientLayer = CAGradientLayer()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        gradientLayer.frame = self.bounds
        let color1 = UIColor(white: 1, alpha: 0.2).cgColor
        let color2 = UIColor(white: 1, alpha: 0.2).cgColor
        let color3 = UIColor.clear.cgColor
        let color4 = UIColor(white: 0, alpha: 0.05).cgColor
        
        gradientLayer.colors = [color1, color2, color3, color4]
        gradientLayer.locations = [0.0, 0.04, 0.95, 1.0]
        layer.insertSublayer(gradientLayer, at: 0)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = self.bounds
    }

}
