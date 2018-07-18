//
//  CustomLayout.swift
//  Day10 - ScrollCard
//
//  Created by 刘乙灏 on 2018/7/18.
//  Copyright © 2018年 刘乙灏. All rights reserved.
//

import UIKit

class CustomLayout: UICollectionViewFlowLayout {
    // 缩放因子
    let scaleFactor: CGFloat = 0.001
    
    override func prepare() {
        super.prepare()
    }
    
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        let array = super.layoutAttributesForElements(in: rect)
        
        let collectionViewCenterX = (self.collectionView?.frame.size.width)! * 0.5 + (self.collectionView?.contentOffset.x)!
        
        for attributes in array! {
            let distance = abs(attributes.center.x - collectionViewCenterX)
            let scale: CGFloat = 1 / (1 + distance * scaleFactor)
            attributes.transform = CGAffineTransform(scaleX: scale, y: scale)
        }
        return array
        
    }
    
    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
        let offsetX = proposedContentOffset.x
        let offsetY = proposedContentOffset.y
        
        let viewW = collectionView!.frame.size.width
        let viewH = collectionView!.frame.size.height
        
        // 获取可视区域
        let targetRect = CGRect(x: offsetX, y: offsetY, width: viewW, height: viewH)
        
        // 中心点
        let centerX = offsetX + viewW / 2
        
        // 获取可视区域的attrs对象
        let attrArr = super.layoutAttributesForElements(in: targetRect)!
        // 寻找据中心点最近的 cell
        var centerAttr = attrArr[0]
        for attributes in attrArr {
            // 比较哪个元素的中心点距离 中心点近
            if (abs(attributes.center.x-centerX) < abs(centerAttr.center.x-centerX)) {
                centerAttr = attributes
            }
        }
        
        // 计算出距离中心点 最小的那个cell 和 整体中心点的偏移 - 进行调整
        let fixOffsetX  = centerAttr.center.x - centerX
        return CGPoint(x: fixOffsetX+offsetX, y: offsetY)
    }
    
    
}
