//
//  PhotoModel.swift
//  Day17 - Pinterest
//
//  Created by 刘乙灏 on 2018/7/23.
//  Copyright © 2018年 刘乙灏. All rights reserved.
//

import UIKit

struct PhotoModel: Codable {
    var Caption: String
    var Comment: String
    var Photo: String
    
    static func allPhotos() -> [PhotoModel] {
        var photos = [PhotoModel]()
        
        let URL = Bundle.main.url(forResource: "Photos", withExtension: "json")
        do {
            let data = try Data(contentsOf: URL!)
            photos = try JSONDecoder().decode([PhotoModel].self, from: data)
        } catch  {
            return photos
        }
        
        return photos
    }

}
