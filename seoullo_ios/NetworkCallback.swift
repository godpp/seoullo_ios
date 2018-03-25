//
//  NetworkCallback.swift
//  seoullo_ios
//
//  Created by 갓거 on 2017. 10. 3..
//  Copyright © 2017년 갓거. All rights reserved.
//

protocol NetworkCallback {
    
    func networkResult(resultData:Any, code:String)
    func networkFailed()
    
}
