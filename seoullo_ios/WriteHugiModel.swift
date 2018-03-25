//
//  WriteHugiModel.swift
//  seoullo_ios
//
//  Created by 갓거 on 2017. 10. 26..
//  Copyright © 2017년 갓거. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper
import AlamofireObjectMapper
import SwiftyJSON

class WriteHugiModel : NetworkModel {
    
    
    func writehugiModel(placeid: Int, content: String, title: String, placeimage: Data?, token: String) {
        let URL : String = "\(baseURL)/place/upload"
        
        
        //let placeid = placeid.data(using: .utf8)
        let content = content.data(using: .utf8)
        let title = title.data(using: .utf8)
        //let token = token.data(using: .)
    
        if placeimage == nil{
            
        }
        else{
            
            Alamofire.upload(multipartFormData : { multipartFormData in
            
            //멀티파트를 이용해 데이터를 담습니다
            multipartFormData.append(placeimage!, withName: "placeimage", fileName: "placeimage.jpg", mimeType: "image/png")
            multipartFormData.append("\(placeid)".data(using: .utf8)!, withName: "placeid")
            multipartFormData.append(content!, withName: "content")
            multipartFormData.append(title!, withName: "title")
            //multipartFormData.append(token!, withName: "Authorization")

        },
                         
            to: URL, method: .post, headers: ["Authorization": token],
                         encodingCompletion: { encodingResult in
                            
                            switch encodingResult{
                            case .success(let upload, _, _):
                                upload.responseData { res in
                                    switch res.result {
                                    case .success:
                                        DispatchQueue.main.async(execute: {
                                            print("dispatc Queue")
                                            self.view.networkResult(resultData: "", code: "6")
                                        })
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
        }
            
        )
        }
    }//Alamofire.upload
}
