//
//  Main_DetailVC.swift
//  seoullo_ios
//
//  Created by 갓거 on 2017. 10. 20..
//  Copyright © 2017년 갓거. All rights reserved.
//

import Foundation
import UIKit
import SDWebImage

class Main_DetailVC : UIViewController, NetworkCallback{
    
    @IBOutlet var segmentedControl: UISegmentedControl!
    @IBOutlet var detailView: UIView!
    @IBOutlet var hugiView: UIView!
    
    @IBOutlet var detailImgView: UIImageView!
    @IBOutlet var placenameLabel: UILabel!
    @IBOutlet var detailAddressLabel: UILabel!
    @IBOutlet var likeBtn: UIButton!
    
    @IBOutlet var infoDetailAddressLabel: UILabel!
    @IBOutlet var infoPlaceTelLabel: UILabel!
    @IBOutlet var infoOpentimeLabel: UILabel!
    @IBOutlet var infoIntroduceLabel: UILabel!
    
    var placeInfo : [DetailItemVO]?
    var placename : String?
    var writer : String?
    var placeid : Int?
    var token : String?
    var nickname : String?
    let ud = UserDefaults.standard
    var islike : Int?
    var likecount : Int?
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if (segue.identifier == "hugiSegue") {
            let hugivc = segue.destination as! Main_hugiVC
            hugivc.placeid = gino(placeid)
        }
    }
    
    @IBAction func segmentedControl(_ sender: UISegmentedControl) {
        
        if sender.selectedSegmentIndex == 0{
            detailView.isHidden = false
            hugiView.isHidden = true
        }
        else{
            hugiView.isHidden = false
            detailView.isHidden = true
        }
        
    }
    @IBAction func writeHugiBtn(_ sender: UIButton) {
        guard let writeHugiVC = storyboard?.instantiateViewController(withIdentifier: "WriteHugiVC") as? WriteHugiVC else{
            return
        }
        writeHugiVC.placename = gsno(placename)
        writeHugiVC.placeid = placeid
        writeHugiVC.token = gsno(token)
        writeHugiVC.writer = gsno(nickname)
        self.present(writeHugiVC, animated: true, completion: nil)
    }
    
    @IBAction func clickLikeBtn(_ sender: UIButton) {
    
        let model = DetailModel(self)
        model.likeLike(placeid: gino(placeid), token: gsno(token))
        
        print(gino(placeid))
        print(gsno(token))
    }
    
    
    override func viewDidLoad() {
        token = ud.string(forKey: "token")
        nickname = ud.string(forKey: "nickname")
        ud.set(placeid, forKey: "placeid")
        ud.synchronize()
        let bar:UINavigationBar! =  self.navigationController?.navigationBar
        bar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.init(red: 0/255, green: 157/255, blue: 76/255, alpha: 1)]
        self.navigationItem.title = "1km, 서울로7017"
        self.navigationController?.navigationBar.topItem?.title = ""
        self.navigationController?.navigationBar.tintColor = UIColor.init(red: 0/255, green: 157/255, blue: 76/255, alpha: 1)
        let model = DetailModel(self)
        model.placeModel(placeid: gino(placeid), token: gsno(token))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        segmentedControl.backgroundColor = UIColor.white
        segmentedControl.tintColor = UIColor.clear
        segmentedControl.setTitle("정보", forSegmentAt: 0)
        segmentedControl.setTitle("후기", forSegmentAt: 1)
        segmentedControl.setTitleTextAttributes([NSForegroundColorAttributeName : UIColor.white], for: .selected)
        segmentedControl.setTitleTextAttributes([NSForegroundColorAttributeName : UIColor.init(red: 69/255.0, green: 154/255.0, blue: 85/255.0, alpha: 1.0)], for: .normal)
        segmentedControl.setBackgroundImage(UIImage(named:"mypage_segment_white.png"), for: .normal, barMetrics: UIBarMetrics.default)
        segmentedControl.setBackgroundImage(UIImage(named: "mypage_segment_green.png"), for: .selected, barMetrics: UIBarMetrics.default)
        segmentedControl.frame = CGRect(x: 0, y: 309, width: 375, height: 40)
    }
    
    func networkResult(resultData: Any, code: String) {
        if code == "6"{
            placeInfo = resultData as? [DetailItemVO]
            print("6success")
            
            placename = gsno(placeInfo?[0].place_name)
            
            placenameLabel.text = gsno(placeInfo?[0].place_name)
            detailImgView.sd_setImage(with: URL(string: gsno(placeInfo?[0].place_picture)), placeholderImage: UIImage(named: "placeholder.png"))
            detailAddressLabel.text = gsno(placeInfo?[0].place_address)
            islike = gino(placeInfo?[0].islike)
            likecount = gino(placeInfo?[0].like_count)
            
            if islike == 1{
                likeBtn.setBackgroundImage(UIImage(named: "information_icon_heart_full.png" ), for: .normal)
            }
            else{
                likeBtn.setBackgroundImage(UIImage(named: "information_icon_heart_line.png" ), for: .normal)
            }
            
            infoDetailAddressLabel.text = "위치 설명 : " + gsno(placeInfo?[0].place_address)
            infoPlaceTelLabel.text = "전화 번호 : " + gsno(placeInfo?[0].place_tel)
            infoOpentimeLabel.text = "오픈 시간 : " + gsno(placeInfo?[0].place_opentime)
            infoIntroduceLabel.text = "장소 설명 : " + gsno(placeInfo?[0].place_introduce)

        }
        
        if code == "10"{
            likeBtn.setBackgroundImage(UIImage(named: "information_icon_heart_full.png" ), for: .normal)
        }
        else if code == "12"{
            likeBtn.setBackgroundImage(UIImage(named: "information_icon_heart_line.png" ), for: .normal)
        }
    }
    
    func networkFailed() {
        simpleAlert(title: "ERROR", msg: "네트워크 연결 오류")
    }
}
