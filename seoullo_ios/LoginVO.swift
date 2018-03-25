//
//  LoginVO.swift
//  seoullo_ios
//
//  Created by Leeseungsoo on 2017. 10. 19..
//  Copyright © 2017년 갓거. All rights reserved.
//

import Foundation
import ObjectMapper

class LoginVO : Mappable {
    
    var msg : String?
    var nickname : String?
    var token : String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        msg <- map["msg"]
        nickname <- map["nickname"]
        token <- map["token"]
    }
    
}
