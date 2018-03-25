//
//  HugiShowVO.swift
//  seoullo_ios
//
//  Created by 갓거 on 2017. 10. 21..
//  Copyright © 2017년 갓거. All rights reserved.
//

import Foundation
import ObjectMapper

class HugiShowItemVO : Mappable {
    
    var article_id : Int?
    var user_id : Int?
    var title : String?
    var place_id : Int?
    var place_picture : String?
    var profile_picture : String?
    var nickname : String?
    var written_time : Int?
    var content : String?
    
    required init?(map: Map) {}
    
    
    func mapping(map: Map) {
        article_id <- map["article_id"]
        user_id <- map["user_id"]
        title <- map["title"]
        place_id <- map["place_id"]
        place_picture <- map["place_picture"]
        profile_picture <- map["profile_picture"]
        nickname <- map["nickname"]
        written_time <- map["written_time"]
        content <- map["content"]
    }
    
}
