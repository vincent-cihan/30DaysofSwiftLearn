//
//  ViewController.swift
//  Day17 - Pinterest
//
//  Created by 刘乙灏 on 2018/7/23.
//  Copyright © 2018年 刘乙灏. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    var photos = PhotoModel.allPhotos()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.collectionView.backgroundColor = .clear
        self.collectionView.contentInset = UIEdgeInsets(top: 23, left: 16, bottom: 10, right: 16)
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
        let collectionViewLayout = PinterestLayout()
        collectionViewLayout.delegate = self
        self.collectionView.collectionViewLayout = collectionViewLayout
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! AnnotatedPhotoCollectionViewCell
        cell.model = photos[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemWidth = (collectionView.frame.size.width - collectionView.contentInset.left - 10 - collectionView.contentInset.right) / 2
        return CGSize(width: itemWidth, height: itemWidth)
    }
}

extension ViewController: PinterestLayoutDelegate {
    func collectionView(_ collectionView: UICollectionView, heightForPhotoAtIndexPath indexPath: IndexPath) -> CGFloat {
        return UIImage(named: photos[indexPath.row].Photo)!.size.height
    }
}

