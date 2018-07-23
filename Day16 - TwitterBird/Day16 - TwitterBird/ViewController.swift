//
//  ViewController.swift
//  Day16 - TwitterBird
//
//  Created by 刘乙灏 on 2018/7/23.
//  Copyright © 2018年 刘乙灏. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var twitterMaskLayer: CALayer!
    var opacityView: UIView!
    var beginTime: CFTimeInterval!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        beginTime = CACurrentMediaTime() + 1
        
        // set up mask
        twitterMaskLayer = CALayer()
        twitterMaskLayer.contents = UIImage(named: "twitter_logo_mask")?.cgImage
        twitterMaskLayer.position = self.view.center
        twitterMaskLayer.bounds = CGRect(x: 0, y: 0, width: 100, height: 80)
        
        self.view.layer.mask = twitterMaskLayer
        self.maskAnimation()
        
        opacityView = UIView(frame: self.view.bounds)
        opacityView.backgroundColor = .white
        self.view.addSubview(opacityView)
        
        self.opacityAnimation()
    }
    
    func maskAnimation() {
        let anim = CAKeyframeAnimation(keyPath: "bounds")
        
        // 原始 - 变小 - 完全展开
        let startValue = twitterMaskLayer.bounds
        let middleValue = CGRect(x: 0, y: 0, width: 100 * 0.8, height: 80 * 0.8)
        let endValue = CGRect(x: 0, y: 0, width: 2000, height: 2000)
        anim.values = [startValue, middleValue, endValue]
        
        // 时间分配
        anim.keyTimes = [0, 0.4, 1]
        
        anim.beginTime = self.beginTime
        anim.duration = 1
        anim.delegate = self;
        
        self.twitterMaskLayer.add(anim, forKey: nil)
    }
    
    func opacityAnimation() {
        let anim = CAKeyframeAnimation(keyPath: "opacity")
        anim.beginTime = self.beginTime
        anim.duration = 1
        anim.keyTimes = [0, 0.4, 1]
        anim.values = [1, 1, 0]
        anim.delegate = self
        opacityView.layer.add(anim, forKey: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController: CAAnimationDelegate {
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        self.view.layer.mask = nil;
        self.opacityView.removeFromSuperview()
    }
}

