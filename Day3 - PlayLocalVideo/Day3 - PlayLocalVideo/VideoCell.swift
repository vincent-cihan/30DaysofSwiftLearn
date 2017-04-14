//
//  VideoCell.swift
//  Day3 - PlayLocalVideo
//
//  Created by 刘乙灏 on 2017/4/14.
//  Copyright © 2017年 刘乙灏. All rights reserved.
//

import UIKit

struct video {
    let image: String
    let title: String
    let source: String
}

class VideoCell: UITableViewCell {
    
    @IBOutlet weak var videoScreenshot: UIImageView!
    @IBOutlet weak var videoSourceLabel: UILabel!
    @IBOutlet weak var videoTitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
