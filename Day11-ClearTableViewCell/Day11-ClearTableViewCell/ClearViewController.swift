//
//  ClearViewController.swift
//  Day11-ClearTableViewCell
//
//  Created by 刘乙灏 on 2017/7/15.
//  Copyright © 2017年 刘乙灏. All rights reserved.
//

import UIKit

class ClearViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var tableView : UITableView {
        let tv = UITableView(frame: UIScreen.main.bounds, style: UITableViewStyle.plain)
        tv.delegate = self
        tv.dataSource = self
        tv.separatorStyle = UITableViewCellSeparatorStyle.none
        tv.tableFooterView = UIView(frame: CGRect.zero)
        tv.register(TableViewCell.self, forCellReuseIdentifier: "TableViewCell")
        return tv
    }
    
    var dataArray: Array<Any>? {
        return ["Read 3 article on Medium", "Cleanup bedroom", "Go for a run", "Hit the gym", "Build another swift project", "Movement training", "Fix the layout problem of a client project", "Write the experience of #30daysSwift", "Inbox Zero", "Booking the ticket to Chengdu", "Test the Adobe Project Comet", "Hop on a call to mom"]
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        UIApplication.shared.isStatusBarHidden = true
        self.view.addSubview(self.tableView)
        
        self.view.backgroundColor = UIColor.black
        // Do any additional setup after loading the view.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataArray!.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath)
        
        cell.textLabel?.text = self.dataArray?[indexPath.row] as? String
        cell.textLabel?.textColor = UIColor.white
        cell.textLabel?.backgroundColor = UIColor.clear
        cell.textLabel?.font = UIFont(name: "Avenir Next", size: 18)
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        
        let itemCount = (self.dataArray?.count)! - 1
        let color = (CGFloat(indexPath.row) / CGFloat(itemCount)) * 0.6
        cell.backgroundColor = UIColor(red: 1.0, green: color, blue: 0.0, alpha: 1.0)
        
        return cell
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
