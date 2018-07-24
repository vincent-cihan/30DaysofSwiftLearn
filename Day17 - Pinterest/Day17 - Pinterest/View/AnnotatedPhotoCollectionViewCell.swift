//
//  AnnotatedPhotoCollectionViewCell.swift
//  Day17 - Pinterest
//
//  Created by 刘乙灏 on 2018/7/23.
//  Copyright © 2018年 刘乙灏. All rights reserved.
//

import UIKit

class AnnotatedPhotoCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var commentLabel: UILabel!
    @IBOutlet weak var captionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = 6
        self.clipsToBounds = true
    }
    
    var model: PhotoModel? {
        didSet {
            if let photoModel = model {
                imageView.image = UIImage(named: photoModel.Photo)
                captionLabel.text = photoModel.Caption
                commentLabel.text = photoModel.Comment
            }
        }
    }
}
