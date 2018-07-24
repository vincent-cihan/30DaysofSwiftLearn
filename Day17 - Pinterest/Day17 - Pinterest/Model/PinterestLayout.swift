//
//  PinterestLayout.swift
//  Day17 - Pinterest
//
//  Created by 刘乙灏 on 2018/7/23.
//  Copyright © 2018年 刘乙灏. All rights reserved.
//

import UIKit

class PinterestLayout: UICollectionViewLayout {
    
    weak var delegate: PinterestLayoutDelegate!
    
    var numberOfColumns = 2
    var cellPadding: CGFloat = 6
    var cache = [UICollectionViewLayoutAttributes]()
    var contentHeight: CGFloat = 0
    var contentWidth: CGFloat {
        guard let collectionView = self.collectionView else {
            return 0
        }
        
        let insets = collectionView.contentInset
        return collectionView.bounds.width - insets.left - insets.right
    }
    
    override var collectionViewContentSize: CGSize {
        return CGSize(width: contentWidth, height: contentHeight)
    }
    
    // 核心
    override func prepare() {
        guard cache.isEmpty, let collectionView = self.collectionView else {
            return
        }
        
        guard collectionView.numberOfItems(inSection: 0) > 0 else {
            return
        }
        
        // 每一列的宽度
        let columnWidth = contentWidth / CGFloat(numberOfColumns)
        // 水平偏移量
        var xOffset = [CGFloat]()
        for column in 0 ..< numberOfColumns {
            xOffset.append(columnWidth * CGFloat(column))
        }
        
        var column = 0
        // 每一列 y 的偏移量，初始化为0
        var yOffset = [CGFloat](repeating: 0, count: numberOfColumns)
        for item in 0 ..< collectionView.numberOfItems(inSection: 0) {
            // 计算每个frame
            let indexPath = IndexPath(item: item, section: 0)
            let photoHeight = delegate.collectionView(collectionView, heightForPhotoAtIndexPath: indexPath)
            let height = cellPadding * 2 + photoHeight
            let frame = CGRect(x: xOffset[column], y: yOffset[column], width: columnWidth, height: height)
            let insertFrame = frame.insetBy(dx: cellPadding, dy: cellPadding)
            
            let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
            attributes.frame = insertFrame
            cache.append(attributes)
            
            contentHeight = max(contentHeight, frame.maxY)
            yOffset[column] += height
            
            // 列指针变化
            column = column < (numberOfColumns - 1) ? column + 1 : 0
            
        }
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        var visibleLayourAttributes = [UICollectionViewLayoutAttributes]()
        for attributes in cache {
            if attributes.frame.intersects(rect) {
                visibleLayourAttributes.append(attributes)
            }
        }
        return visibleLayourAttributes
    }
    
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        return cache[indexPath.row]
    }
}

protocol PinterestLayoutDelegate: class {
    func collectionView(_ collectionView: UICollectionView, heightForPhotoAtIndexPath indexPath: IndexPath) -> CGFloat
}











