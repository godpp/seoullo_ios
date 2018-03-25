//
//  SignupModel.swift
//  seoullo_ios
//
//  Created by Leeseungsoo on 2017. 10. 19..
//  Copyright © 2017년 갓거. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper
import AlamofireObjectMapper
import SwiftyJSON

class SignupModel : NetworkModel {
    
    func usernameCheck(nickname: String, flag: Int){
        let URL = "\(baseURL)/signup/dup"
        
        let body : [String:Any] = [
            "nickname": nickname,
            "flag": flag
        ]
        
        Alamofire.request(URL, method: .post, parameters: body, encoding: JSONEncoding.default, headers: nil).responseObject{
            (response:DataResponse<SignupVO>) in
            switch response.result{
            case .success:
                guard let Message = response.result.value else{
                    self.view.networkFailed()
                    return
                }
                if Message.msg == "3" {
                    self.view.networkResult(resultData: "", code: "dup_name_ok")
                }
                else if Message.msg == "4" {
                    self.view.networkResult(resultData: "", code: "dup_name_fail")
                }
                else {
                    self.view.networkFailed()
                }
            case .failure(let err):
                print(err)
                self.view.networkFailed()
            }
        }
    }
    
    func emailCheck(email: String, flag: Int) {
        let URL = "\(baseURL)/signup/dup"
        
        let body : [String:Any] = [
            "email": email,
            "flag": flag
        ]
        
        Alamofire.request(URL, method: .post, parameters: body, encoding: JSONEncoding.default, headers: nil).responseObject{
            (response:DataResponse<SignupVO>) in
            switch response.result{
            case .success:
                guard let Message = response.result.value else{
                    self.view.networkFailed()
                    return
                }
                if Message.msg == "3" {
                    self.view.networkResult(resultData: "", code: "dup_email_ok")
                }
                else if Message.msg == "4" {
                    self.view.networkResult(resultData: "", code: "dup_email_fail")
                }
                else {
                    self.view.networkFailed()
                }
            case .failure(let err):
                print(err)
                self.view.networkFailed()
            }
        }
        
    }
    func signup(nickname: String, email: String, password: String) {
        let URL = "\(baseURL)/signup"
        
        let body : [String:String] = [
            "nickname" : nickname,
            "email": email,
            "password": password
        ]
        
        Alamofire.request(URL, method: .post, parameters: body, encoding: JSONEncoding.default, headers: nil).responseObject{
            (response:DataResponse<SignupVO>) in
            switch response.result {
            case .success:
                guard let Message = response.value else{
                    self.view.networkFailed()
                    return
                }
                if Message.msg == "1" {
                    self.view.networkResult(resultData: "", code: "signup_other")
                }
                else if Message.msg == "2" {
                    self.view.networkResult(resultData: "", code: "signup_ok")
                }
                else if Message.msg == "3" {
                    self.view.networkResult(resultData: "", code: "signup_fail")
                }
            case .failure(let err):
                print(err)
                self.view.networkFailed()
            }
        }
    }
    
}
