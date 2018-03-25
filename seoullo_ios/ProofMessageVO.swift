//
//  ProofMessageVO.swift
//  seoullo_ios
//
//  Created by 갓거 on 2017. 10. 27..
//  Copyright © 2017년 갓거. All rights reserved.
//

import Foundation
import ObjectMapper

class ProofMessageVO : Mappable{
    
    var msg : String?
    var result : [ProofShotVO]?
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        msg <- map["msg"]
        result <- map["result"]
    }
}
