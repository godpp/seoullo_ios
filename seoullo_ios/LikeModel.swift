//
//  likeModel.swift
//  seoullo_ios
//
//  Created by 갓거 on 2017. 10. 28..
//  Copyright © 2017년 갓거. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper
import AlamofireObjectMapper

class LikeModel : NetworkModel {
    
    func likeLike(placeid: Int, token: String) {
        
        let URL = "\(baseURL)/place/updatelike"
        
        let body = ["placeid" : placeid]
        
        Alamofire.request(URL, method: .post, parameters: body, encoding: JSONEncoding.default,headers: ["Authorization": token]).responseObject{
            (response:DataResponse<LikeVO>) in
            switch response.result {
            case .success:
                guard let Message = response.result.value else{
                    self.view.networkFailed()
                    return
                }
                
                if Message.msg == "9" {
                    if let islike = Message.islike{
                        self.view.networkResult(resultData: islike, code: "10")
                    }
                }
                else if Message.msg == "12"{
                    if let unislike = Message.islike{
                        self.view.networkResult(resultData: unislike, code: "12")
                    }
                }
                
                
            case .failure(let err):
                print(err)
                self.view.networkFailed()
            }
        }
    }
    
        
}
