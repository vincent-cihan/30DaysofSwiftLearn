//
//  ArtistModel.swift
//  Day15 - SizingTableViewCell
//
//  Created by 刘乙灏 on 2018/7/20.
//  Copyright © 2018年 刘乙灏. All rights reserved.
//

import UIKit

struct ArtistModel: Codable {
    var name: String
    var bio: String
    var image: String
    var works: [Work]
    
    static func artistsFromBundle() -> [ArtistModel] {
        var artists = [ArtistModel]()
        
        guard let url = Bundle.main.url(forResource: "artists", withExtension: "json") else {
            return artists
        }
        
        let data = try? Data(contentsOf: url)
        let artistsDic = try? JSONDecoder().decode([String: [ArtistModel]].self, from: data!)
        
        if let artistsArray = artistsDic!["artists"] {
            artists = artistsArray
        }
        
        return artists
    }
}

struct Work: Codable {
    var title: String
    var image: String
    var info: String
    var isExpanded: Bool = false
    
    enum CodingKeys: String, CodingKey {
        case title
        case image
        case info
    }
}
