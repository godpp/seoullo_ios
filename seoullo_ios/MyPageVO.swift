//
//  MyPageVO.swift
//  seoullo_ios
//
//  Created by Leeseungsoo on 2017. 10. 30..
//  Copyright © 2017년 갓거. All rights reserved.
//

import ObjectMapper

class MyPageVO : Mappable {
    var nickname : String?
    var profile_picture : String?
    var introduce : String?
    
    required init?(map: Map) {
        
    }
    func mapping(map: Map) {
        nickname <- map["nickname"]
        profile_picture <- map["profile_picture"]
        introduce <- map["introduce"]
    }
}
