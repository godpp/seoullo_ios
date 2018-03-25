//
//  SignupVO.swift
//  seoullo_ios
//
//  Created by Leeseungsoo on 2017. 10. 19..
//  Copyright © 2017년 갓거. All rights reserved.
//

import Foundation
import ObjectMapper

class SignupVO: Mappable {
    var msg : String?
    
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        msg <- map["msg"]
        
    }
    
    
}
