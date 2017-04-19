//
//  ViewController.swift
//  Day5-CarouselEffect
//
//  Created by 刘乙灏 on 2017/4/19.
//  Copyright © 2017年 刘乙灏. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    var interests = Interest.createInterests()

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return interests.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "InterestCell", for: indexPath) as! InterestCollectionViewCell
        cell.interest = interests[indexPath.row]
        return cell
    }
    
}
