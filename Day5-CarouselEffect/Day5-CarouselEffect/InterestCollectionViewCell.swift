//
//  InterestCollectionViewCell.swift
//  Day5-CarouselEffect
//
//  Created by 刘乙灏 on 2017/4/19.
//  Copyright © 2017年 刘乙灏. All rights reserved.
//

import UIKit

class InterestCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var featuredImageView: UIImageView!
    @IBOutlet weak var interestTitleLabel: UILabel!
    
    var interest: Interest! {
        didSet {
            updateUI()
        }
    }
    
    func updateUI() {
        interestTitleLabel.text = interest.title
        featuredImageView.image = interest.featuredImage
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = 5.0
        self.clipsToBounds = true
    }
}
