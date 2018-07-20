//
//  DouBanModel.swift
//  Day14 - MoyaExample
//
//  Created by 刘乙灏 on 2018/7/20.
//  Copyright © 2018年 刘乙灏. All rights reserved.
//

import UIKit
import HandyJSON

class DouBanSongModel: HandyJSON {
    var title: String?
    var artist: String?
    
    required init() {
        
    }
}

class DouBanModel: HandyJSON {
    var name: String?
    var channel_id: String?
    
    required init() {
        
    }
}
