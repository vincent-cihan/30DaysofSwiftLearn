//
//  ViewController.swift
//  Day12 - Limited Input Text Field
//
//  Created by 刘乙灏 on 2018/7/18.
//  Copyright © 2018年 刘乙灏. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextViewDelegate {

    @IBOutlet weak var toolsView: UIView!
    @IBOutlet weak var tweetTextView: UITextView!
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var toolsViewBottomConstraint: NSLayoutConstraint!
    
    let allowTextLength = 60
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        view.backgroundColor = UIColor.init(red: 234 / 255, green: 234 / 255, blue: 234 / 255, alpha: 1)
        
        tweetTextView.delegate = self
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(_:)), name: Notification.Name.UIKeyboardWillChangeFrame, object: nil)
    }
    
    @IBAction func doneAction(_ sender: UIBarButtonItem) {
        tweetTextView.text = ""
        countLabel.text = "\(allowTextLength)"
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        return range.location + text.count <= allowTextLength
    }
    
    func textViewDidChange(_ textView: UITextView) {
        countLabel.text = "\(allowTextLength - textView.text.count)"
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @objc func keyboardWillChange(_ note: Notification) {
        if let userInfo = note.userInfo {
            let duration = userInfo[UIKeyboardAnimationDurationUserInfoKey]
            let endFrame = (userInfo[UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
            
            let bottomMargin = UIScreen.main.bounds.height - endFrame.origin.y
            
            if bottomMargin > 0 {
                self.toolsViewBottomConstraint.constant = -bottomMargin+34
            } else {
                self.toolsViewBottomConstraint.constant = 0
            }
            UIView.animate(withDuration: duration as! TimeInterval) {
                //                if bottomMargin > 0 {
                //                    self.toolsView.frame.origin.y -= bottomMargin
                //                } else {
                //                    self.toolsView.frame.origin.y = self.view.frame.height - 50
                //                }
                self.toolsView.layoutIfNeeded()
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

