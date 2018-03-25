//
//  ProofShotVO.swift
//  seoullo_ios
//
//  Created by 갓거 on 2017. 10. 27..
//  Copyright © 2017년 갓거. All rights reserved.
//

import Foundation
import ObjectMapper

class ProofShotVO: Mappable {
    var place_picture : String?
    
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        place_picture <- map["place_picture"]
        
    }
    
    
}
