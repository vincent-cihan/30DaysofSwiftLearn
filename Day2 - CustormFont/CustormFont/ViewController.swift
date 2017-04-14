//
//  ViewController.swift
//  CustormFont
//
//  Created by 刘乙灏 on 2017/4/14.
//  Copyright © 2017年 刘乙灏. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var data = ["30 Days Swift", "这些字体特别适合打「奋斗」和「理想」", "谢谢「造字工房」，本案例不涉及商业使用", "使用到造字工房劲黑体，致黑体，童心体", "呵呵，再见🤗 See you next Project", "微博 @Allen朝辉",
                "测试测试测试测试测试测试",
                "123",
                "Alex",
                "@@@@@@"]
    var fontNames = ["MFTongXin_Noncommercial-Regular", "MFJinHei_Noncommercial-Regular", "MFZhiHei_Noncommercial-Regular", "edundot", "Gaspar Regular"]
    
    var fontRowIndex = 0
    
    @IBOutlet weak var changeFontButton: UIButton!
    
    @IBOutlet weak var fontTableView: UITableView!

    @IBAction func changeFontButtonClick(_ sender: UIButton) {
        fontRowIndex = (fontRowIndex + 1) % 5
        print(fontNames[fontRowIndex])
        fontTableView.reloadData()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        fontTableView.delegate = self
        fontTableView.dataSource = self
        changeFontButton.layer.cornerRadius = 55
        
        for family in UIFont.familyNames {
            for font in UIFont.fontNames(forFamilyName: family) {
                print(font)
            }
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 35
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FontCell", for: indexPath)
        let text = data[indexPath.row]
        cell.textLabel?.text = text
        cell.textLabel?.textColor = UIColor.white
        cell.textLabel?.font = UIFont(name: fontNames[fontRowIndex], size: 16)
        return cell
    }

}

