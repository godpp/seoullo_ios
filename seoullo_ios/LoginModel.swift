//
//  LoginModel.swift
//  seoullo_ios
//
//  Created by Leeseungsoo on 2017. 10. 18..
//  Copyright © 2017년 갓거. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper
import AlamofireObjectMapper

class LoginModel : NetworkModel {
    
    func login(email: String, password: String) {
        
        let URL = "\(baseURL)/login"
        let ud = UserDefaults.standard
        let body : [String:String] = [
            "email": email,
            "password": password
        ]
        
        Alamofire.request(URL, method: .post, parameters: body, encoding: JSONEncoding.default, headers: nil).responseObject{
            (response:DataResponse<LoginVO>) in
            switch response.result {
            case .success:
                guard let Message = response.result.value else{
                    self.view.networkFailed()
                    return
                }
                if Message.msg == "1" {
                }
                else if Message.msg == "4" {
                    self.view.networkResult(resultData: "", code: "login_4")
                }
                else if Message.msg == "6" {
                    self.view.networkResult(resultData: "", code: "login_6")
            
                }
                else if Message.msg == "7" {
                    if let msg = Message.msg{
                        ud.setValue(Message.token!, forKey: "token")
                        ud.setValue(Message.nickname!, forKey: "nickname")
                        ud.synchronize()
                        self.view.networkResult(resultData: "", code: "login_7")
                    }
                    
                }
                else {
                    self.view.networkResult(resultData: "", code: "login_fail")
                }
                
                
            case .failure(let err):
                print(err)
                self.view.networkFailed()
            }
        }
        
        
    }
    
    
    
}
