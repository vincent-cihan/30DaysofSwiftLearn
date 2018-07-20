//
//  ArtistListViewController.swift
//  Day15 - SizingTableViewCell
//
//  Created by 刘乙灏 on 2018/7/20.
//  Copyright © 2018年 刘乙灏. All rights reserved.
//

import UIKit

class ArtistListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    let artists = ArtistModel.artistsFromBundle()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 100
        
        // bug: 在 ib 中设置此属性有问题，always big
        navigationController?.navigationBar.prefersLargeTitles = true
        
        // 监听 Larger Text Accessibility feature
        NotificationCenter.default.addObserver(forName: .UIContentSizeCategoryDidChange, object: .none, queue: OperationQueue.main) { [weak self] _ in
            self?.tableView.reloadData()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if let destination = segue.destination as? ArtistDetailViewController,
//            let indexPath = tableView.indexPathForSelectedRow {
//            destination.selectedArtist = artists[indexPath.row]
//        }
//    }

}

extension ArtistListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return artists.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! ArtistTableViewCell
        
        let artist = artists[indexPath.row]
        cell.artistImageView.image = UIImage(named: artist.image)
        cell.nameLabel.text = artist.name
        cell.bioLabel.text = artist.bio
        
        cell.nameLabel.font = UIFont.preferredFont(forTextStyle: .headline)
        cell.bioLabel.font = UIFont.preferredFont(forTextStyle: .body)
        
        return cell
    }
}
