//
//  ViewController.swift
//  StopWatch
//
//  Created by 刘乙灏 on 2017/4/14.
//  Copyright © 2017年 刘乙灏. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var Reset: UIButton!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var playBtn: UIButton!
    @IBOutlet weak var pauseBtn: UIButton!
    
    var counter = 0.0
    var timer = Timer()
    var isPlaying = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timeLabel.text = String(counter)
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func resetBtnClick(_ sender: UIButton) {
        timer.invalidate()
        isPlaying = false
        counter = 0
        timeLabel.text = String(counter)
        playBtn.isEnabled = true
        pauseBtn.isEnabled = true
    }
    @IBAction func playBtnClick(_ sender: UIButton) {
        if isPlaying {
            return
        }
        playBtn.isEnabled = false
        pauseBtn.isEnabled = true
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        isPlaying = true
    }

    @IBAction func pauseBtnClick(_ sender: UIButton) {
        playBtn.isEnabled = true
        pauseBtn.isEnabled = false
        timer.invalidate()
        isPlaying = false
    }
    
    func updateTimer() {
        counter += 0.1
        timeLabel.text = String(format: "%.1f", counter)
    }
}

