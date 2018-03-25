//
//  LikeVO.swift
//  seoullo_ios
//
//  Created by 갓거 on 2017. 10. 28..
//  Copyright © 2017년 갓거. All rights reserved.
//

import Foundation
import ObjectMapper

class LikeVO: Mappable {
    var msg : String?
    var islike : Int?
    
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        msg <- map["msg"]
        islike <- map["islike"]
    }
    
    
}
