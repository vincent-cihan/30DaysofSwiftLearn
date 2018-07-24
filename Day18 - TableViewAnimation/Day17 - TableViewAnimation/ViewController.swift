//
//  ViewController.swift
//  Day17 - TableViewAnimation
//
//  Created by 刘乙灏 on 2018/7/24.
//  Copyright © 2018年 刘乙灏. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    fileprivate let items = ["2-Color", "Simple 2D Rotation", "Multicolor", "Multi Point Position", "BezierCurve Position", "Color and Frame Change", "View Fade In", "Pop"]
    
    let cellHeight: CGFloat = 60
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.delegate = self;
        tableView.dataSource = self;
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableAnimation()
    }

    func tableAnimation() {
        tableView.reloadData()
        
        let cells = tableView.visibleCells
        let tableHeight = tableView.bounds.height
        
        for cell in cells {
            cell.transform = CGAffineTransform(translationX: 0, y: tableHeight)
        }
        
        for (index, cell) in cells.enumerated() {
            let delayTime = 0.05 * Double(index)
            UIView.animate(withDuration: 1, delay: delayTime, options: [], animations: {
                cell.transform = CGAffineTransform(translationX: 0, y: 0)
            }, completion: nil)
        }
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeight
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Basic Animations"
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.backgroundColor = .clear
        cell.textLabel?.text = items[indexPath.row]
        cell.textLabel?.textColor = .white
        
        let upperFactor: CGFloat = CGFloat(indexPath.row) / CGFloat(items.count)
        let lowerFactor: CGFloat = upperFactor - 0.2
        let upperColor: CGColor = UIColor(red: 1.0, green: 147 / 255, blue: upperFactor, alpha: 1).cgColor
        let lowerColor: CGColor = UIColor(red: 1.0, green: 147 / 255, blue: lowerFactor, alpha: 1).cgColor
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [upperColor, lowerColor]
        gradientLayer.locations = [0, 1]
        gradientLayer.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: cellHeight)
        cell.layer.insertSublayer(gradientLayer, at: 0)
        
        return cell
    }
}








