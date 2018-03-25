//
//  ProofShotModel.swift
//  seoullo_ios
//
//  Created by 갓거 on 2017. 10. 27..
//  Copyright © 2017년 갓거. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper
import AlamofireObjectMapper

class ProofShotModel : NetworkModel {
    
    func proofshot(id : Int) {
        
        let URL = "\(baseURL)/main/allphoto/\(id)"
        
        Alamofire.request(URL, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseObject{
            (response:DataResponse<ProofMessageVO>) in
            switch response.result {
            case .success:
                guard let Message = response.result.value else{
                    self.view.networkFailed()
                    return
                }
                
                if Message.msg == "2" {
                    if let picture = Message.result{
                        self.view.networkResult(resultData: picture, code: "2")
                    }
                }
                
                
            case .failure(let err):
                print(err)
                self.view.networkFailed()
            }
        }
        
        
    }
    
    
    
}
