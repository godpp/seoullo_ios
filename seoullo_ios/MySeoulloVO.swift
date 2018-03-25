//
//  MySeoulloVO.swift
//  seoullo_ios
//
//  Created by Leeseungsoo on 2017. 10. 30..
//  Copyright © 2017년 갓거. All rights reserved.
//

import ObjectMapper

class MySeoulloVO : Mappable {
    var place_id : Int?
    var place_picture : String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        place_id <- map["place_id"]
        place_picture <- map["place_picture"]
    }
}
