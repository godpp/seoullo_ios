//
//  NetworkModel.swift
//  seoullo_ios
//
//  Created by 갓거 on 2017. 10. 3..
//  Copyright © 2017년 갓거. All rights reserved.
//

class NetworkModel {

    var view : NetworkCallback
 
    
    init(_ vc : NetworkCallback){
        self.view = vc
    }
    
    let baseURL = "http://13.125.86.182:3000"
}
