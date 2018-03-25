//
//  RankMsgVO.swift
//  seoullo_ios
//
//  Created by 갓거 on 2017. 10. 29..
//  Copyright © 2017년 갓거. All rights reserved.
//

import Foundation
import ObjectMapper

class RankMsgVO : Mappable{
    
    var msg : String?
    var result : [RankVO]?
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        msg <- map["msg"]
        result <- map["result"]
    }
}
