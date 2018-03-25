//
//  MypageVC.swift
//  seoullo_ios
//
//  Created by 갓거 on 2017. 10. 6..
//  Copyright © 2017년 갓거. All rights reserved.
//

import Foundation
import UIKit

class MypageVC : UIViewController,UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegate, UICollectionViewDataSource, NetworkCallback{
    
    @IBOutlet var profileImageView: UIImageView!
    @IBOutlet var myName: UILabel!
    @IBOutlet var myIntroduce: UILabel!
    
    @IBOutlet var mySeoulloView: UICollectionView!
    @IBOutlet var myWriteView: UIView!
    @IBOutlet var seguementedControl: UISegmentedControl!
    @IBOutlet var myTableView: UITableView!
    
    @IBOutlet var popupView: UIView!
    @IBOutlet var centerPopupConstraint: NSLayoutConstraint!
    @IBOutlet var cancelBtn: UIButton!
    @IBOutlet var completeBtn: UIButton!
    @IBOutlet var introChangeTxt: UITextField!
    @IBOutlet var currentTxtLength: UILabel!
    @IBOutlet var backgroundBtn: UIButton!
    let limitLength = 15
    
    let imagePicker = UIImagePickerController()
    
    var myInfo : [MyPageVO] = []
    var mySeoulloList : [MySeoulloVO] = [MySeoulloVO]()
    var myReivewList : [MyReviewVO] = [MyReviewVO]()
    
    var seoulloId = Int.max
    var reviewId = Int.max
    
    var myToken = UserDefaults.standard.string(forKey: "token")
    
    @IBAction func logoutBtn(_ sender: Any) {
        //UserDefaults.standard.removeSuite(named: "token")
        
        let alert = UIAlertController(title: title, message: "로그아웃 하시겠습니까?", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인", style: .default) { (UIAlertAction) in
            let Login = UIStoryboard(name: "Login", bundle: nil)
            guard let splshVC = Login.instantiateViewController(withIdentifier: "SplashVC") as? SplashVC else{
                return
            }
            self.present(splshVC, animated: true, completion: nil)
        }
        let cancelAction = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        alert.addAction(cancelAction)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    override func viewDidLoad() {
        //네비바 설정
        let bar:UINavigationBar! =  self.navigationController?.navigationBar
        bar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.init(red: 0/255, green: 157/255, blue: 76/255, alpha: 1)]
        self.navigationItem.title = "1km, 서울로7017"
        self.navigationController?.navigationBar.topItem?.title = ""
        self.navigationController?.navigationBar.tintColor = UIColor.init(red: 0/255, green: 157/255, blue: 76/255, alpha: 1)
        
        myTableView.tableFooterView = UIView.init(frame : CGRect.zero)
        myTableView.estimatedRowHeight = 100.0
        myTableView.rowHeight = UITableViewAutomaticDimension
        
        seguementedControl.backgroundColor = UIColor.white
        seguementedControl.tintColor = UIColor.clear
        seguementedControl.setTitle("나의 서울로", forSegmentAt: 0)
        seguementedControl.setTitle("내가 쓴 후기", forSegmentAt: 1)
        seguementedControl.setTitleTextAttributes([NSForegroundColorAttributeName : UIColor.white], for: .selected)
        seguementedControl.setTitleTextAttributes([NSForegroundColorAttributeName : UIColor.init(red: 69/255.0, green: 154/255.0, blue: 85/255.0, alpha: 1.0)], for: .normal)
        seguementedControl.setBackgroundImage(UIImage(named:"mypage_segment_white.png"), for: .normal, barMetrics: UIBarMetrics.default)
        seguementedControl.setBackgroundImage(UIImage(named: "mypage_segment_green.png"), for: .selected, barMetrics: UIBarMetrics.default)
        //seguementedControl.frame = CGRect(x: 0, y: 260, width: 375, height: 40)
        
        popupView.layer.cornerRadius = 10
        popupView.layer.masksToBounds = true
        popupView.layer.shadowColor = UIColor.darkGray.cgColor
        popupView.layer.shadowRadius = 20
        popupView.layer.shadowOpacity = 1.0
        popupView.layer.shadowOffset = CGSize(width: 0, height: 0)
        cancelBtn.layer.cornerRadius = 10
        cancelBtn.layer.masksToBounds = true
        completeBtn.layer.cornerRadius = 10
        completeBtn.layer.masksToBounds = true
        backgroundBtn.isHidden = true
        mySeoulloView.isHidden = false
        myWriteView.isHidden = true
        introChangeTxt.addTarget(self, action: #selector(currentLengthOfTxt), for: .editingChanged)
        introChangeTxt.addTarget(self, action: #selector(checkMaxLength(textField:)), for: .editingChanged)
        completeBtn.addTarget(self, action: #selector(completeChange), for: .touchUpInside)
        
        mySeoulloView.delegate = self
        mySeoulloView.dataSource = self
        myTableView.delegate = self
        myTableView.dataSource = self
        imagePicker.allowsEditing = false
        imagePicker.delegate = self
        //사진 이미지뷰 둥글게 만들기
        profileImageView.layer.masksToBounds = true
        profileImageView.layer.cornerRadius = profileImageView.frame.size.width / 2
        let model = MypageModel(self)
        model.getMyInfo(token: gsno(myToken))
        
    }
    override func viewWillAppear(_ animated: Bool) {
        let model = MypageModel(self)
        model.getMySeoullo(id: seoulloId, token: gsno(myToken))
        model.getMyReview(id: reviewId, token: gsno(myToken))
    }
    
    // 세그먼티드 컨트롤
    @IBAction func seguementedControl(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0{
            mySeoulloView.isHidden = false
            myWriteView.isHidden = true
        }
        else{
            mySeoulloView.isHidden = true
            myWriteView.isHidden = false
        }
    }
    
    @IBAction func introduceChange(_ sender: Any) {
        introChangeTxt.text = ""
        currentTxtLength.text = ""
        centerPopupConstraint.constant = 0
        UIView.animate(withDuration: 0.2, animations: {
            self.view.layoutIfNeeded()
            self.backgroundBtn.isHidden = false
        })
        
    }
    func currentLengthOfTxt(){
        let length = (introChangeTxt.text?.characters.count)!
        currentTxtLength.text = "\(length)"
    }
    
    func checkMaxLength(textField: UITextField!) {
        if (textField.text?.characters.count)! > limitLength {
            textField.deleteBackward()
        }
    }
    func completeChange() {
        let text = introChangeTxt.text
        let model = MypageModel(self)
        model.introduceChange(token: gsno(myToken), introduce: gsno(text))
        centerPopupConstraint.constant = 350
        UIView.animate(withDuration: 0.1, animations: {
            self.view.layoutIfNeeded()
            self.backgroundBtn.isHidden = true
        })
    }
    
    @IBAction func closePopup(_ sender: Any) {
        centerPopupConstraint.constant = 350
        UIView.animate(withDuration: 0.1, animations: {
            self.view.layoutIfNeeded()
            self.backgroundBtn.isHidden = true
        })
    }
    
    
    
    @IBAction func profileChange(_ sender: Any) {
        let alert = UIAlertController(title: "프로필 사진 변경", message: nil, preferredStyle: .actionSheet)
        let pickOnGallery = UIAlertAction(title: "앨범에서 사진 선택", style: .default){
            (_) in
            self.present(self.imagePicker, animated: true, completion: nil)
        }
        let changeDefault = UIAlertAction(title: "기본이미지로 변경", style: .default){
            (_) in
            let defaultImg = UIImage(named: "mypage_icon_profile")
            self.profileImageView.image = defaultImg
            let model = MypageModel(self)
            let imageData = UIImageJPEGRepresentation(defaultImg!, 0.5)
            model.profileChange(token: self.gsno(self.myToken), imageData: imageData)
        }
        let cancelAction = UIAlertAction(title: "취소", style: .cancel)
        alert.addAction(pickOnGallery)
        alert.addAction(changeDefault)
        alert.addAction(cancelAction)
        present(alert, animated: true)
    }
    
    
    //콜렉션뷰
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return mySeoulloList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = mySeoulloView.dequeueReusableCell(withReuseIdentifier: "mySeoulCell", for: indexPath) as! mySeoulCell
        let MySeoullo = mySeoulloList[indexPath.row]
        
        cell.mySeoulImageView.imageFromUrl(gsno(MySeoullo.place_picture), defaultImgPath: "mypage_myseoullo_icon_graybox.png")
        return cell
    }
    //컬렉션뷰 끝
    
    func networkResult(resultData: Any, code: String) {
        if code == "5" {
            myInfo = resultData as! [MyPageVO]
            self.myName.text = myInfo[0].nickname
            self.myIntroduce.text = myInfo[0].introduce
            self.myIntroduce.sizeToFit()
            self.profileImageView.imageFromUrl(myInfo[0].profile_picture, defaultImgPath: "mypage_icon_profile.png")
        }
        
        if code == "8" {
            mySeoulloList = resultData as! [MySeoulloVO]
            mySeoulloView.reloadData()
            for item in 0...mySeoulloList.count-1 {
                print(mySeoulloList[item])
            }
        }
        else if code == "5"{
            mySeoulloList.removeAll()
            mySeoulloView.reloadData()
        }
        if code == "6" {
            myReivewList = resultData as! [MyReviewVO]
            myTableView.reloadData()
        }
        if code == "profile_change" {
            let model = MypageModel(self)
            model.getMyInfo(token: gsno(myToken))
        }
        if code == "introduce_change" {
            let model = MypageModel(self)
            model.getMyInfo(token: gsno(myToken))
        }
    }
    
    
    //테이블뷰
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myReivewList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTableView.dequeueReusableCell(withIdentifier: "MyReviewCell") as! MyReviewCell
        let MyReview = myReivewList[indexPath.row]
        
        let format = DateFormatter()
        let date = Date(timeIntervalSince1970: TimeInterval(gino(MyReview.written_time)/1000))
        format.timeZone = NSTimeZone.local
        format.dateFormat = "yyyy.MM.dd"
        let dateString = format.string(from: date)
        cell.title.text = MyReview.title
        cell.content.text = MyReview.content
        cell.nickname.text = MyReview.nickname
        cell.written_time.text = dateString
        cell.place_picture.imageFromUrl(gsno(MyReview.place_picture), defaultImgPath: "review_greenbox_squre.png")
        return cell
    }
    //테이블 뷰 끝
    
    func networkFailed() {
        simpleAlert(title: "ERROR", msg: "네트워크 연결을 확인하세요.")
    }
    
}

extension MypageVC : UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        var newImage: UIImage
        if let possibleImage = info["UIImagePickerControllerEditedImage"] as? UIImage {
            newImage = possibleImage
        } else if let possibleImage = info["UIImagePickerControllerOriginalImage"] as? UIImage {
            newImage = possibleImage
        } else {
            
            return
        }
        profileImageView.image = newImage
        let model = MypageModel(self)
        let imageData = UIImageJPEGRepresentation(newImage, 0.5)
        model.profileChange(token: gsno(myToken), imageData: imageData)
        dismiss(animated: true, completion: nil)
    }
}
