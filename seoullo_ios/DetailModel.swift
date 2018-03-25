//
//  DetailModel.swift
//  seoullo_ios
//
//  Created by 갓거 on 2017. 10. 20..
//  Copyright © 2017년 갓거. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper
import AlamofireObjectMapper
import SwiftyJSON

class DetailModel : NetworkModel {
    
    func rank(flag: Int) {
        
        let URL = "\(baseURL)/filter/rank/\(flag)"
        
        
        Alamofire.request(URL, method: .get, parameters: nil, encoding: JSONEncoding.default,headers: nil).responseObject{
            (response:DataResponse<RankMsgVO>) in
            switch response.result {
            case .success:
                guard let Message = response.result.value else{
                    self.view.networkFailed()
                    return
                }
                
                if Message.msg == "3" {
                    if let ranklist = Message.result{
                        self.view.networkResult(resultData: ranklist, code: "3")
                    }
                }
                
                
            case .failure(let err):
                print(err)
                self.view.networkFailed()
            }
        }
    }
    
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

    
    func placeModel(placeid : Int, token: String){
        
        let URL : String = "\(baseURL)/place/placeInfo/\(placeid)"
        
        
        Alamofire.request(URL, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: ["Authorization": token]).responseObject{
            
            (response : DataResponse<DetailVO>) in
            
            switch response.result{
                
            case .success:
                
                guard let message = response.result.value else{
                    self.view.networkFailed()
                    return
                }
                if message.msg == "9"{
                    if let unLoginplaceInfo = message.result{
                        self.view.networkResult(resultData: unLoginplaceInfo, code: "9")
                    }
                }
                else if message.msg == "6"{
                    if let LoginplaceInfo = message.result{
                        self.view.networkResult(resultData: LoginplaceInfo, code: "6")
                    }
                }
                else if message.msg == "1"{
                    self.view.networkResult(resultData: "200", code: "1")
                }
                else if message.msg == "2"{
                    self.view.networkResult(resultData: "503", code: "2")
                }
                else if message.msg == "3"{
                    self.view.networkResult(resultData: "503", code: "3")
                }
                else if message.msg == "4"{
                    self.view.networkResult(resultData: "200", code: "4")
                }
                else if message.msg == "5"{
                    self.view.networkResult(resultData: "503", code: "5")
                }
                else if message.msg == "7"{
                    self.view.networkResult(resultData: "503", code: "7")
                }
                else if message.msg == "8"{
                    self.view.networkResult(resultData: "503", code: "8")
                }
                
                
            case .failure(let err):
                print(err)
                self.view.networkFailed()
            }
            
        }
    }
    
    func hugiModel(placeid : Int,id : Int){
        
        let URL : String = "\(baseURL)/place/review?placeid=\(placeid)&id=\(id)"
        
        
        Alamofire.request(URL, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseObject{
            
            (response : DataResponse<HugiShowVO>) in
            
            switch response.result{
                
            case .success:
                
                guard let message = response.result.value else{
                    self.view.networkFailed()
                    return
                }
                if message.msg == "3"{
                    if let articles = message.result{
                        self.view.networkResult(resultData: articles, code: "3")
                    }
                }
                else {
                    self.view.networkResult(resultData: "커넥팅 에러(503)", code: "2")
                }
                
                
            case .failure(let err):
                print(err)
                self.view.networkFailed()
            }
            
        }
    }
}
