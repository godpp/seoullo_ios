//
//  MypageModel.swift
//  seoullo_ios
//
//  Created by Leeseungsoo on 2017. 10. 30..
//  Copyright © 2017년 갓거. All rights reserved.
//

import Alamofire
import ObjectMapper
import AlamofireObjectMapper
import SwiftyJSON

class MypageModel : NetworkModel {
    
    func getMyInfo(token: String) {
        let URL = "\(baseURL)/mypage/myinfo"
        let headers : HTTPHeaders = [
            "Authorization" : token
        ]
        Alamofire.request(URL, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: headers).responseObject{
            (response: DataResponse<MyPageResultVO>) in
            switch response.result {
            case .success:
                guard let Message = response.result.value else {
                    self.view.networkFailed()
                    return
                }
                if Message.msg == "5" {
                    if let results = Message.result {
                        self.view.networkResult(resultData: results, code: "5")
                    }
                }
            case .failure(let err):
                print(err)
                self.view.networkFailed()
                
            }
        }
        
    }
    
    
    func getMySeoullo(id: Int, token: String) {
        let URL = "\(baseURL)/mypage/myseoullo/\(id)"
        let headers : HTTPHeaders = [
            "Authorization" : token
        ]
        
        Alamofire.request(URL, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: headers).responseObject{
            (response: DataResponse<MySeoulloListVO>) in
            switch response.result {
            case .success:
                guard let Message = response.result.value else{
                    self.view.networkFailed()
                    return
                }
                if Message.msg == "8" {
                    if let results = Message.result {
                        
                        self.view.networkResult(resultData: results, code: "8")
                    }
                }
                else if Message.msg == "6"{
                    if let results = Message.result{
                        self.view.networkResult(resultData: results, code: "5")
                    }
                }
                
            case .failure(let err):
                print(err)
                self.view.networkFailed()
            }
        }
        
        
    }
    
    func getMyReview (id: Int, token: String) {
        let URL = "\(baseURL)/mypage/myarticle/\(id)"
        let headers : HTTPHeaders = [
            "Authorization" : token
        ]
        Alamofire.request(URL, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: headers).responseObject{
            (response: DataResponse<MyReviewListVO>) in
            switch response.result {
            case .success:
                guard let Message = response.result.value else{
                    self.view.networkFailed()
                    return
                }
                if Message.msg == "6" {
                    if let results = Message.result {
                        self.view.networkResult(resultData: results, code: "6")
                    }
                }
            case .failure(let err):
                print(err)
                self.view.networkFailed()
                
            }
        }
    }
    func profileChange(token: String, imageData: Data?){
        let URL = "\(baseURL)/mypage/profileupdate"
        let headers : HTTPHeaders = [
            "Authorization" : token
        ]
        if imageData == nil{
            
        }else{
            Alamofire.upload(multipartFormData : { multipartFormData in
                multipartFormData.append(imageData!, withName: "profileimg", fileName: "profileimg.jpg", mimeType: "profileimg/png")
            },
                             to: URL,
                             method: .post,
                             headers: headers,
                             encodingCompletion: { encodingResult in
                                
                                switch encodingResult{
                                case .success(let upload, _, _):
                                    upload.responseData { res in
                                        switch res.result {
                                        case .success:
                                            if let value = res.result.value {
                                                let data = JSON(value)
                                                let msg = data["msg"].stringValue
                                                if msg == "5" {
                                                    print("profile_change")
                                                    DispatchQueue.main.async(execute: {
                                                        self.view.networkResult(resultData: "", code: "profile_change")
                                                    })
                                                }
                                            }
                                            
                                        case .failure(let err):
                                            print("upload Error : \(err)")
                                            DispatchQueue.main.async(execute: {
                                                self.view.networkFailed()
                                            })
                                        }
                                    }
                                case .failure(let err):
                                    print("network Error : \(err)")
                                    self.view.networkFailed()
                                }//switch
            })//Alamofire.upload
        }
        
    }
    
    func introduceChange(token: String, introduce: String){
        let URL = "\(baseURL)/mypage/profileupdate"
        let body : [String:String] = [
            "introduce" : introduce
        ]
        let headers : HTTPHeaders = [
            "Authorization" : token
        ]
        
        Alamofire.request(URL, method: .post, parameters: body, encoding: JSONEncoding.default, headers: headers).responseObject{
            (response: DataResponse<MyPageMessageVO>) in
            switch response.result {
            case .success:
                guard let Message = response.result.value else{
                    self.view.networkFailed()
                    return
                }
                if Message.msg == "5" {
                    self.view.networkResult(resultData: "", code: "introduce_change")
                }
            case .failure(let err):
                print(err)
                self.view.networkFailed()
                
            }
        }
        
    }
    
}
