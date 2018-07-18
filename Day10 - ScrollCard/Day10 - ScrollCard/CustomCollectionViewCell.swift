//
//  CustomCollectionViewCell.swift
//  Day10 - ScrollCard
//
//  Created by 刘乙灏 on 2018/7/18.
//  Copyright © 2018年 刘乙灏. All rights reserved.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    var imageView: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        imageView = UIImageView(frame: self.bounds)
        self.addSubview(imageView)
        
        self.layer.cornerRadius = 5
        self.clipsToBounds = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
