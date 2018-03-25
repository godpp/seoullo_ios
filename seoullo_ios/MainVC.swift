//
//  MainVC.swift
//  seoullo_ios
//
//  Created by 갓거 on 2017. 10. 6..
//  Copyright © 2017년 갓거. All rights reserved.
//

import Foundation
import UIKit
import SDWebImage


class MainVC : UIViewController, NetworkCallback{
    
    @IBOutlet var mainView: UIView!
    @IBOutlet var segmentedControl: UISegmentedControl!
    @IBOutlet var landscapeContainerView: UIView!
    @IBOutlet var walkloadContainerView: UIView!
    @IBOutlet var keyspaceContainerView: UIView!
    
    //landscape oullet
    @IBOutlet var curiositypot_hear_Btn: UIButton!
    @IBOutlet var roseice_Btn: UIButton!
    @IBOutlet var seoulloplaza_Btn: UIButton!
    @IBOutlet var curiositypot_amazing_Btn: UIButton!
    @IBOutlet var hydrangeabread_Btn: UIButton!
    @IBOutlet var naturerest_Btn: UIButton!
    @IBOutlet var seoullostore_Btn: UIButton!
    @IBOutlet var curiosity_see_Btn: UIButton!
    @IBOutlet var rosestage_Btn: UIButton!
    @IBOutlet var bangbang_Btn: UIButton!
    @IBOutlet var magnoliastage_Btn: UIButton!
    @IBOutlet var magnoliacafe_Btn: UIButton!
    
    //walkload oullet
    @IBOutlet var mallidongplaza_Btn: UIButton!
    @IBOutlet var yoonseul_Btn: UIButton!
    @IBOutlet var roseyard_Btn: UIButton!
    @IBOutlet var seoulstationplaza_Btn: UIButton!
    @IBOutlet var toegyerodirectionconnection_Btn: UIButton!
    @IBOutlet var toegyerodirection_Btn: UIButton!
    @IBOutlet var magnoliayard_Btn: UIButton!
    @IBOutlet var buildingconnection_Btn: UIButton!
    @IBOutlet var hanyangconnection_Btn: UIButton!
    
    //keypoint outlet
    @IBOutlet var seoulpot_Btn: UIButton!
    @IBOutlet var gardenclass_Btn: UIButton!
    @IBOutlet var seoullocenter_Btn: UIButton!
    @IBOutlet var seoullocafe_Btn: UIButton!
    @IBOutlet var seoullomanagement_Btn: UIButton!
    @IBOutlet var seoulloinfo_Btn: UIButton!
    
    
    var emogermoFrame = CGRect(x: -162, y: 0, width: 162, height: 127)
    var emogermoImgArray = [String]()
    
    @IBAction func curiositypot_hear(_ sender: Any) {
        guard let detailVC = storyboard?.instantiateViewController(withIdentifier: "Main_DetailVC") as? Main_DetailVC else{
            return
        }
        detailVC.placeid = 7
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
    
    //시설 액션
    @IBAction func roseice(_ sender: Any) {
        guard let detailVC = storyboard?.instantiateViewController(withIdentifier: "Main_DetailVC") as? Main_DetailVC else{
            return
        }
        detailVC.placeid = 9
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
    
    @IBAction func rosestage(_ sender: Any) {
        guard let detailVC = storyboard?.instantiateViewController(withIdentifier: "Main_DetailVC") as? Main_DetailVC else{
            return
        }
        detailVC.placeid = 10
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
    
    @IBAction func seoulplaza(_ sender: Any) {
        guard let detailVC = storyboard?.instantiateViewController(withIdentifier: "Main_DetailVC") as? Main_DetailVC else{
            return
        }
        detailVC.placeid = 11
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
    
    @IBAction func curiosityamazing(_ sender: Any) {
        guard let detailVC = storyboard?.instantiateViewController(withIdentifier: "Main_DetailVC") as? Main_DetailVC else{
            return
        }
        detailVC.placeid = 19
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
    
    @IBAction func bangbang(_ sender: Any) {
        guard let detailVC = storyboard?.instantiateViewController(withIdentifier: "Main_DetailVC") as? Main_DetailVC else{
            return
        }
        detailVC.placeid = 12
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
    
    @IBAction func hydrangeabread(_ sender: Any) {
        guard let detailVC = storyboard?.instantiateViewController(withIdentifier: "Main_DetailVC") as? Main_DetailVC else{
            return
        }
        detailVC.placeid = 14
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
    
    @IBAction func naturerest(_ sender: Any) {
        guard let detailVC = storyboard?.instantiateViewController(withIdentifier: "Main_DetailVC") as? Main_DetailVC else{
            return
        }
        detailVC.placeid = 13
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
    
    @IBAction func seoulstore(_ sender: Any) {
        guard let detailVC = storyboard?.instantiateViewController(withIdentifier: "Main_DetailVC") as? Main_DetailVC else{
            return
        }
        detailVC.placeid = 17
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
    
    @IBAction func magnoliastage(_ sender: Any) {
        guard let detailVC = storyboard?.instantiateViewController(withIdentifier: "Main_DetailVC") as? Main_DetailVC else{
            return
        }
        detailVC.placeid = 15
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
    
    @IBAction func curiositysee(_ sender: Any) {
        guard let detailVC = storyboard?.instantiateViewController(withIdentifier: "Main_DetailVC") as? Main_DetailVC else{
            return
        }
        detailVC.placeid = 20
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
    
    @IBAction func magnoliacafe(_ sender: Any) {
        guard let detailVC = storyboard?.instantiateViewController(withIdentifier: "Main_DetailVC") as? Main_DetailVC else{
            return
        }
        detailVC.placeid = 16
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
    
    //주요지점 액션
    @IBAction func seoulpot(_ sender: Any) {
        guard let detailVC = storyboard?.instantiateViewController(withIdentifier: "Main_DetailVC") as? Main_DetailVC else{
            return
        }
        detailVC.placeid = 4
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
    
    @IBAction func gardenclass(_ sender: Any) {
        guard let detailVC = storyboard?.instantiateViewController(withIdentifier: "Main_DetailVC") as? Main_DetailVC else{
            return
        }
        detailVC.placeid = 8
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
    @IBAction func seoulcenter(_ sender: Any) {
        guard let detailVC = storyboard?.instantiateViewController(withIdentifier: "Main_DetailVC") as? Main_DetailVC else{
            return
        }
        detailVC.placeid = 21
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
    
    @IBAction func seoullocafe(_ sender: Any) {
        guard let detailVC = storyboard?.instantiateViewController(withIdentifier: "Main_DetailVC") as? Main_DetailVC else{
            return
        }
        detailVC.placeid = 1
        self.navigationController?.pushViewController(detailVC, animated: true)
        
    }
    
    @IBAction func seoullomanagement(_ sender: Any) {
        guard let detailVC = storyboard?.instantiateViewController(withIdentifier: "Main_DetailVC") as? Main_DetailVC else{
            return
        }
        detailVC.placeid = 6
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
    
    @IBAction func seoulloinfo(_ sender: Any) {
        guard let detailVC = storyboard?.instantiateViewController(withIdentifier: "Main_DetailVC") as? Main_DetailVC else{
            return
        }
        detailVC.placeid = 2
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
    
    @IBAction func segmentedChange(_ sender: UISegmentedControl) {

        if sender.selectedSegmentIndex == 0{
            landscapeContainerView.isHidden = false
            walkloadContainerView.isHidden = true
            keyspaceContainerView.isHidden = true
            
            //landscape ishidden
            curiositypot_hear_Btn.isHidden = false
            roseice_Btn.isHidden = false
            seoulloplaza_Btn.isHidden = false
            curiositypot_amazing_Btn.isHidden = false
            hydrangeabread_Btn.isHidden = false
            naturerest_Btn.isHidden = false
            seoullostore_Btn.isHidden = false
            curiosity_see_Btn.isHidden = false
            rosestage_Btn.isHidden = false
            bangbang_Btn.isHidden = false
            magnoliastage_Btn.isHidden = false
            magnoliacafe_Btn.isHidden = false
            
            //walkload ishidden
            mallidongplaza_Btn.isHidden = true
            yoonseul_Btn.isHidden = true
            roseyard_Btn.isHidden = true
            seoulstationplaza_Btn.isHidden = true
            toegyerodirectionconnection_Btn.isHidden = true
            toegyerodirection_Btn.isHidden = true
            magnoliayard_Btn.isHidden = true
            buildingconnection_Btn.isHidden = true
            hanyangconnection_Btn.isHidden = true
            
            //keypoint outlet
            seoulpot_Btn.isHidden = true
            gardenclass_Btn.isHidden = true
            seoullocenter_Btn.isHidden = true
            seoullocafe_Btn.isHidden = true
            seoullomanagement_Btn.isHidden = true
            seoulloinfo_Btn.isHidden = true
        }
        else if sender.selectedSegmentIndex == 1{
            landscapeContainerView.isHidden = true
            walkloadContainerView.isHidden = false
            keyspaceContainerView.isHidden = true
            
            //landscape ishidden
            curiositypot_hear_Btn.isHidden = true
            roseice_Btn.isHidden = true
            seoulloplaza_Btn.isHidden = true
            curiositypot_amazing_Btn.isHidden = true
            hydrangeabread_Btn.isHidden = true
            naturerest_Btn.isHidden = true
            seoullostore_Btn.isHidden = true
            curiosity_see_Btn.isHidden = true
            rosestage_Btn.isHidden = true
            bangbang_Btn.isHidden = true
            magnoliastage_Btn.isHidden = true
            magnoliacafe_Btn.isHidden = true
            
            //walkload ishidden
            mallidongplaza_Btn.isHidden = false
            yoonseul_Btn.isHidden = false
            roseyard_Btn.isHidden = false
            seoulstationplaza_Btn.isHidden = false
            toegyerodirectionconnection_Btn.isHidden = false
            toegyerodirection_Btn.isHidden = false
            magnoliayard_Btn.isHidden = false
            buildingconnection_Btn.isHidden = false
            hanyangconnection_Btn.isHidden = false
            
            //keypoint outlet
            seoulpot_Btn.isHidden = true
            gardenclass_Btn.isHidden = true
            seoullocenter_Btn.isHidden = true
            seoullocafe_Btn.isHidden = true
            seoullomanagement_Btn.isHidden = true
            seoulloinfo_Btn.isHidden = true
        }
        else{
            landscapeContainerView.isHidden = true
            walkloadContainerView.isHidden = true
            keyspaceContainerView.isHidden = false
            
            //landscape ishidden
            curiositypot_hear_Btn.isHidden = true
            roseice_Btn.isHidden = true
            seoulloplaza_Btn.isHidden = true
            curiositypot_amazing_Btn.isHidden = true
            hydrangeabread_Btn.isHidden = true
            naturerest_Btn.isHidden = true
            seoullostore_Btn.isHidden = true
            curiosity_see_Btn.isHidden = true
            rosestage_Btn.isHidden = true
            bangbang_Btn.isHidden = true
            magnoliastage_Btn.isHidden = true
            magnoliacafe_Btn.isHidden = true
            
            //walkload ishidden
            mallidongplaza_Btn.isHidden = true
            yoonseul_Btn.isHidden = true
            roseyard_Btn.isHidden = true
            seoulstationplaza_Btn.isHidden = true
            toegyerodirectionconnection_Btn.isHidden = true
            toegyerodirection_Btn.isHidden = true
            magnoliayard_Btn.isHidden = true
            buildingconnection_Btn.isHidden = true
            hanyangconnection_Btn.isHidden = true
            
            //keypoint outlet
            seoulpot_Btn.isHidden = false
            gardenclass_Btn.isHidden = false
            seoullocenter_Btn.isHidden = false
            seoullocafe_Btn.isHidden = false
            seoullomanagement_Btn.isHidden = false
            seoulloinfo_Btn.isHidden = false
        }
    }
    
    
    @IBAction func mypageBtn(_ sender: Any) {
        guard let mypageVC = storyboard?.instantiateViewController(withIdentifier: "MypageVC") as? MypageVC else{
            return
        }
        self.navigationController?.pushViewController(mypageVC, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //네비바 설정
        let bar:UINavigationBar! =  self.navigationController?.navigationBar
        bar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.init(red: 0/255, green: 157/255, blue: 76/255, alpha: 1)]
        self.navigationItem.title = "1km, 서울로7017"
        
        let model = DetailModel(self)
        model.rank(flag: 1)
    }
    
    override func viewDidLoad() {
        
        landscapeContainerView.isHidden = false
        walkloadContainerView.isHidden = true
        keyspaceContainerView.isHidden = true
        
        //조경 버튼 비활성화
        mallidongplaza_Btn.isEnabled = false
        yoonseul_Btn.isEnabled = false
        roseyard_Btn.isEnabled = false
        seoulstationplaza_Btn.isEnabled = false
        toegyerodirection_Btn.isEnabled = false
        toegyerodirectionconnection_Btn.isEnabled = false
        buildingconnection_Btn.isEnabled = false
        magnoliayard_Btn.isEnabled = false
        hanyangconnection_Btn.isEnabled = false
        
        segmentedControl.backgroundColor = UIColor.white
        segmentedControl.tintColor = UIColor.clear
        segmentedControl.setTitle("시설", forSegmentAt: 0)
        segmentedControl.setTitle("조경", forSegmentAt: 1)
        segmentedControl.setTitle("주요지점", forSegmentAt: 2)
        segmentedControl.setTitleTextAttributes([NSForegroundColorAttributeName : UIColor.white], for: .selected)
        segmentedControl.setTitleTextAttributes([NSForegroundColorAttributeName : UIColor.init(red: 0/255.0, green: 157/255.0, blue: 76/255.0, alpha: 1.0)], for: .normal)
    segmentedControl.setBackgroundImage(UIImage(named:"mypage_segment_white.png"), for: .normal, barMetrics: UIBarMetrics.default)
        segmentedControl.setBackgroundImage(UIImage(named: "mypage_segment_green.png"), for: .selected, barMetrics: UIBarMetrics.default)
        segmentedControl.frame = CGRect(x: 0, y: 245, width: 375, height: 44)
        
        firstRankImg.clipsToBounds = true
        firstRankImg.layer.cornerRadius = firstRankImg.frame.size.width / 2
        secondRankImg.clipsToBounds = true
        secondRankImg.layer.cornerRadius = secondRankImg.frame.size.width / 2
        thirdRankImg.clipsToBounds = true
        thirdRankImg.layer.cornerRadius = thirdRankImg.frame.size.width / 2
        
    }
    
    var ranklist : [RankVO] = []
    @IBOutlet var firstRankImg: UIImageView!
    @IBOutlet var secondRankImg: UIImageView!
    @IBOutlet var thirdRankImg: UIImageView!
    
    @IBOutlet var firstRankLabel: UILabel!
    @IBOutlet var secondRankLabel: UILabel!
    @IBOutlet var thirdRankLabel: UILabel!
    
    
    func networkResult(resultData: Any, code: String) {
        if code == "3"{
            ranklist = resultData as! [RankVO]
            
            firstRankImg.sd_setImage(with: URL(string: gsno(ranklist[0].place_picture)), placeholderImage: UIImage(named: "review_greenbox_squre.png"))
            secondRankImg.sd_setImage(with: URL(string: gsno(ranklist[1].place_picture)), placeholderImage: UIImage(named: "review_greenbox_squre.png"))
            thirdRankImg.sd_setImage(with: URL(string: gsno(ranklist[2].place_picture)), placeholderImage: UIImage(named: "review_greenbox_squre.png"))
            
            firstRankLabel.text = gsno(ranklist[0].place_name)
            secondRankLabel.text = gsno(ranklist[1].place_name)
            thirdRankLabel.text = gsno(ranklist[2].place_name)
        }
    }
    func networkFailed() {
        simpleAlert(title: "ERROR", msg: "네트워크 연결 확인")
    }
}
