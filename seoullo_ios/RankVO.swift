//
//  RankVO.swift
//  seoullo_ios
//
//  Created by 갓거 on 2017. 10. 29..
//  Copyright © 2017년 갓거. All rights reserved.
//

import Foundation
import ObjectMapper

class RankVO : Mappable{
    
    var place_name : String?
    var place_picture : String?
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        place_name <- map["place_name"]
        place_picture <- map["place_picture"]
    }
}
