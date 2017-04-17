//
//  ViewController.swift
//  Day4 - Snapchat Menu
//
//  Created by 刘乙灏 on 2017/4/17.
//  Copyright © 2017年 刘乙灏. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UIApplication.shared.isStatusBarHidden = true
        
        let leftVC: LeftViewController = LeftViewController(nibName: "LeftViewController", bundle: nil)
        let centerVC: CameraViewController = CameraViewController(nibName: "CameraViewController", bundle: nil)
        let rightVC: RightViewController = RightViewController(nibName: "RightViewController", bundle: nil)
        
        self.addChildViewController(leftVC)
        self.scrollView.addSubview(leftVC.view)
        leftVC.didMove(toParentViewController: self)
        
        self.addChildViewController(centerVC)
        self.scrollView.addSubview(centerVC.view)
        centerVC.didMove(toParentViewController: self)
        
        self.addChildViewController(rightVC)
        self.scrollView.addSubview(rightVC.view)
        rightVC.didMove(toParentViewController: self)
        
        var centerVCFrame: CGRect = centerVC.view.frame
        centerVCFrame.origin.x = self.view.frame.width
        centerVC.view.frame = centerVCFrame
        
        var rightVCFrame: CGRect = rightVC.view.frame
        rightVCFrame.origin.x = self.view.frame.width * 2
        rightVC.view.frame = rightVCFrame
        
        self.scrollView.contentSize = CGSize(width: self.view.frame.width * 3, height: self.view.frame.height)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

