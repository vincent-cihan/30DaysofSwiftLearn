//
//  ViewController.swift
//  Day13 - StretchyHeader
//
//  Created by 刘乙灏 on 2018/7/19.
//  Copyright © 2018年 刘乙灏. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var headerImageView: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    let datas = [
        "when i was young",
        "i'd listen to the radio",
        "waiting for my favorite songs",
        "when they played i'd sing along",
        "it make me smile"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        cell.textLabel?.text = datas[indexPath.row]
        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        // 偏移量
        let offsetY = scrollView.contentOffset.y
        let tableViewHeight = tableView.frame.height
        // 偏移比例
        let rate = offsetY / tableViewHeight
        let scaleFactor = 1 - rate
        
        headerImageView.transform = CGAffineTransform(scaleX: scaleFactor, y: scaleFactor)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

