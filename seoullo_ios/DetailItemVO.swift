//
//  DetailItemVO.swift
//  seoullo_ios
//
//  Created by 갓거 on 2017. 10. 26..
//  Copyright © 2017년 갓거. All rights reserved.
//

import Foundation
import ObjectMapper

class DetailItemVO : Mappable{
    var islike : Int?
    var place_id : Int?
    var place_name : String?
    var place_address : String?
    var place_picture : String?
    var place_tel : String?
    var place_opentime : String?
    var place_introduce : String?
    var like_count : Int?
    var place_info : String?
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        islike <- map["islike"]
        place_id <- map["place_id"]
        place_name <- map["place_name"]
        place_address <- map["place_address"]
        place_picture <- map["place_picture"]
        place_tel <- map["place_tel"]
        place_opentime <- map["place_opentime"]
        place_introduce <- map["place_introduce"]
        like_count <- map["like_count"]
        place_info <- map["place_info"]
    }
}
