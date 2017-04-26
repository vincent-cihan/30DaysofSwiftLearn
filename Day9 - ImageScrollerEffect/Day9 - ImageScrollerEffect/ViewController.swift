//
//  ViewController.swift
//  Day9 - ImageScrollerEffect
//
//  Created by 刘乙灏 on 2017/4/26.
//  Copyright © 2017年 刘乙灏. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {

    var imageView: UIImageView!
    var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView = UIImageView(image: UIImage(named: "steve"))
        
        configScrollView()
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    fileprivate func configScrollView() {
        scrollView = UIScrollView(frame: view.bounds)
        scrollView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        scrollView.backgroundColor = UIColor.clear
        scrollView.contentSize = imageView.bounds.size
        scrollView.delegate = self
        
        scrollView.addSubview(imageView)
        view.addSubview(scrollView)
        imageView.center = scrollView.center
        
        scrollView.minimumZoomScale = 1
        scrollView.maximumZoomScale = 3.0
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return self.imageView
    }

}

