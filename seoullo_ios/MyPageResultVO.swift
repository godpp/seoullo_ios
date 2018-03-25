//
//  MyPageResultVO.swift
//  seoullo_ios
//
//  Created by Leeseungsoo on 2017. 10. 30..
//  Copyright © 2017년 갓거. All rights reserved.
//

import ObjectMapper

class MyPageResultVO : Mappable {
    
    var msg : String?
    var result : [MyPageVO]?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        msg <- map["msg"]
        result <- map["result"]
    }
}
