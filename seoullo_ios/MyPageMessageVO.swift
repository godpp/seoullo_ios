//
//  MyPageMessageVO.swift
//  seoullo_ios
//
//  Created by Leeseungsoo on 2017. 10. 30..
//  Copyright © 2017년 갓거. All rights reserved.
//

import ObjectMapper

class MyPageMessageVO : Mappable {
    var msg : String?
    required init?(map: Map) {
        
    }
    func mapping(map: Map) {
        msg <- map["msg"]
    }
}
