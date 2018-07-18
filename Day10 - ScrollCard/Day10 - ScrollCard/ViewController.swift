//
//  ViewController.swift
//  Day10 - ScrollCard
//
//  Created by 刘乙灏 on 2018/7/17.
//  Copyright © 2018年 刘乙灏. All rights reserved.
//

import UIKit

let SCREEN_WIDTH = UIScreen.main.bounds.size.width
let SCREEN_HEIGHT = UIScreen.main.bounds.size.height
let SIDE_WIDTH:CGFloat = 50

class ViewController: UIViewController {
    
    var collectionView: UICollectionView!
    lazy var dataSource: [String] = {
        var dataSource = [String]()
        for i in 1...5 {
            dataSource.append("Photo\(i)")
        }
        for i in 1...5 {
            dataSource.append("Photo\(i)")
        }
        return dataSource
    }()
    
    lazy var flowLayout: UICollectionViewFlowLayout = {
        var flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.sectionInset = UIEdgeInsetsMake(0, SIDE_WIDTH / 2, 0, SIDE_WIDTH / 2)
        flowLayout.minimumLineSpacing = 20
        return flowLayout
    }()
    lazy var customLayout: CustomLayout = {
        var customLayout = CustomLayout()
        customLayout.scrollDirection = .horizontal
        customLayout.minimumLineSpacing = 10
        customLayout.sectionInset = UIEdgeInsetsMake(0, SIDE_WIDTH, 0, SIDE_WIDTH)
        return customLayout
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        createRootView()
        createSegmentView()
    }
    
    func createRootView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: flowLayout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: "CustomCollectionViewCell")
        
        let bgImageView = UIImageView(frame: view.bounds)
        bgImageView.image = #imageLiteral(resourceName: "bg")
        
        let blurEffect = UIBlurEffect(style: .light)
        let blurView  = UIVisualEffectView(effect: blurEffect)
        blurView.frame = bgImageView.frame
        bgImageView.addSubview(blurView)
        
        collectionView.backgroundView = bgImageView
        
        view.addSubview(collectionView)
    }
    
    func createSegmentView() {
        let segmentView = UISegmentedControl(items: ["flowLayout", "customLayout"])
        segmentView.frame = CGRect(x: 10, y: 50, width: SCREEN_WIDTH - 20, height: segmentView.bounds.height)
        segmentView.selectedSegmentIndex = 0
        segmentView.tintColor = .white
        segmentView.addTarget(self, action: #selector(segmentDidChanged(sender:)), for: UIControlEvents.valueChanged)
        view.addSubview(segmentView)
    }
    
    @objc func segmentDidChanged(sender: UISegmentedControl) {
        print("changed")
        switch sender.selectedSegmentIndex {
        case 1:
            collectionView.collectionViewLayout = customLayout
        default:
            collectionView.collectionViewLayout = flowLayout
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: SCREEN_HEIGHT * 0.6 / 36 * 22, height: SCREEN_HEIGHT * 0.6)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCollectionViewCell", for: indexPath) as! CustomCollectionViewCell
        cell.imageView.image = UIImage(named: dataSource[indexPath.row])
        return cell
    }
}
