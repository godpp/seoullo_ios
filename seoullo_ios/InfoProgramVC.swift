//
//  InfoEmogermoVC.swift
//  seoullo_ios
//
//  Created by 갓거 on 2017. 10. 20..
//  Copyright © 2017년 갓거. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import AlamofireObjectMapper
import ObjectMapper
import SwiftSoup
import SDWebImage

class InfoProgramVC : UIViewController{
    
    @IBAction func whithsimin_Btn(_ sender: UIButton) {
        if let url = URL(string: "http://seoullo7017.seoul.go.kr/SSF/H/ENJ/010/05010.do") {
            UIApplication.shared.openURL(url)
        }
    }
    @IBAction func simineducation_Btn(_ sender: UIButton) {
        if let url = URL(string: "http://seoullo7017.seoul.go.kr/SSF/H/ENJ/010/08010.do") {
            UIApplication.shared.openURL(url)
        }
    }
    @IBAction func culturetour_Btn(_ sender: UIButton) {
        if let url = URL(string: "http://seoullo7017.seoul.go.kr/SSF/H/ENJ/010/06010.do") {
            UIApplication.shared.openURL(url)
        }
    }
    @IBAction func singing_Btn(_ sender: UIButton) {
        if let url = URL(string: "http://seoullo7017.seoul.go.kr/SSF/H/ENJ/010/07010.do") {
            UIApplication.shared.openURL(url)
        }
    }

}
