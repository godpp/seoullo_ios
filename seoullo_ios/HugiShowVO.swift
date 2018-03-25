//
//  HugiShowVO.swift
//  seoullo_ios
//
//  Created by 갓거 on 2017. 10. 21..
//  Copyright © 2017년 갓거. All rights reserved.
//

import Foundation
import ObjectMapper

class HugiShowVO : Mappable{
    
    var msg : String?
    var result : [HugiShowItemVO]?
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        msg <- map["msg"]
        result <- map["result"]
    }
}
