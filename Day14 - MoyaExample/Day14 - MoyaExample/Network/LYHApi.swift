//
//  LYHApi.swift
//  Day14 - MoyaExample
//
//  Created by 刘乙灏 on 2018/7/20.
//  Copyright © 2018年 刘乙灏. All rights reserved.
//

import Foundation
import Moya

/// 定义基础域名
let LYHBaseURL = "https://www.douban.com"

/// 定义返回的JSON数据字段
let RESULT_CODE = "code"      //状态码
let RESULT_MESSAGE = "message"  //错误消息提示

enum LYHApi {
    case channels // 频道列表
    case playList(channel: String)  //获取歌曲
}

extension LYHApi: TargetType {
    var baseURL: URL {
        switch self {
        case .playList(_):
            return URL(string: "https://douban.fm")!
        default:
            return URL(string: LYHBaseURL)!
        }
    }
    
    var path: String {
        switch self {
        case .channels:
            return "/j/app/radio/channels"
        case .playList(_):
            return "/j/mine/playlist"
        default:
            return ""
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .channels, .playList(_):
            return .get
        default:
            return .post
        }
    }
    
    var sampleData: Data {
        return "".data(using: String.Encoding.utf8)!
    }
    
    //这个就是API里面的核心。
    var task: Task {
        switch self {
//        case .testApi:  // 不传参
//            return .requestPlain
//        case let .testAPi(para1, _)://这里的缺点就是多个参数会导致parameters拼接过长
//            //后台的content-Type 为application/x-www-form-urlencoded时选择URLEncoding
//            return .requestParameters(parameters: ["key":para1], encoding: URLEncoding.default)
//        case let .testApiDict(dict)://所有参数当一个字典进来完事。
//            //后台可以接收json字符串做参数时选这个
//            return .requestParameters(parameters: dict, encoding: JSONEncoding.default)
        case .playList(let channel):
            var params: [String: Any] = [:]
            params["channel"] = channel
            params["type"] = "n"
            params["from"] = "mainsite"
            return .requestParameters(parameters: params,
                                      encoding: URLEncoding.default)
        default:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        // token、请求头的设置可以在这里返回
        return nil;
    }
    
    
}
