//
//  ViewController.swift
//  Day14 - MoyaExample
//
//  Created by 刘乙灏 on 2018/7/19.
//  Copyright © 2018年 刘乙灏. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    // 频道数据
    var channels = [DouBanModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        NetWorkRequest(.channels) { (responseString) in
            if let newChannels = [DouBanModel].deserialize(from: responseString, designatedPath: "channels") {
                newChannels.forEach({ (item) in
                    self.channels.append(item!)
                })
            }
            self.tableView.reloadData()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.channels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath)
        let channel = channels[indexPath.row]
        cell.textLabel?.text = channel.name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let channelName = channels[indexPath.row].name
        let channelId = channels[indexPath.row].channel_id
        NetWorkRequest(.playList(channel: channelId ?? "0")) { (responseString) in
            if let songs = [DouBanSongModel].deserialize(from: responseString, designatedPath: "song") {
                let song = songs[0]
                let message = "歌手\(song?.artist ?? "")\n歌曲\(song?.title ?? "")"
                
                self.showAlert(title: channelName!, message: message)
            }
        }
    }
    
    // 显示消息
    func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "确定", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true, completion: nil)
    }
}

