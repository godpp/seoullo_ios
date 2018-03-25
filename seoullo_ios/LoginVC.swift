//
//  LoginVC.swift
//  seoullo_ios
//
//  Created by 갓거 on 2017. 10. 3..
//  Copyright © 2017년 갓거. All rights reserved.
//

import Foundation
import UIKit

class LoginVC : UIViewController, UIGestureRecognizerDelegate, NetworkCallback{

    
    @IBOutlet var joinBtn: UIButton!
    @IBOutlet var loginBtn: UIButton!
    @IBOutlet var idTxtFd: UITextField!
    @IBOutlet var pwTxtFd: UITextField!
    
    @IBOutlet var loginStackView: UIStackView!
    @IBOutlet var loginBackground: UIImageView!
    @IBOutlet var centerConstraintY: NSLayoutConstraint!
    
    @IBOutlet var backCenterConstrainY: NSLayoutConstraint!
    var check = true
    let grayColor = UIColor.init(red: 127.0/255.0, green: 127.0/255.0, blue: 127.0/255.0, alpha: 1.0)
    
    var myInfo : LoginVO?
    
    override func viewDidLoad() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap_mainview(_:)))
        tap.delegate = self
        self.view.addGestureRecognizer(tap)
        self.initAddTarget()
        unableLoginBtn()
    }
    override func viewWillAppear(_ animated: Bool) {
        registerForKeyboardNotifications()
    }
    override func viewWillDisappear(_ animated: Bool) {
        unregisterForKeyboardNotifications()
    }
    
    func networkResult(resultData: Any, code: String) {
        if code == "login_1" {
        }
        else if code == "login_4" {
            simpleAlert(title: "로그인 오류", msg: "존재하지 않는 계정입니다.")
        }
        else if code == "login_6" {
            simpleAlert(title: "로그인 오류", msg: "비밀번호가 틀립니다.")
        }
        else if code == "login_7" {
            myInfo = resultData as? LoginVO
            let nickname = gsno(myInfo?.nickname)
            let token = gsno(myInfo?.token)
            UserDefaults.standard.setValue(nickname, forKey: "seoullo_nickname")
            UserDefaults.standard.setValue(token, forKey: "seoullo_token")
            UserDefaults.standard.synchronize()
            let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = mainStoryboard.instantiateViewController(withIdentifier: "Main_Tab") as! Main_Tab
            present(vc, animated: true)
        }
        else {
            simpleAlert(title: "네트워크 오류", msg: "서버가 응답하지 않습니다.")
        }
    }
    
    func initAddTarget(){
        loginBtn.addTarget(self, action: #selector(login), for: .touchUpInside)
        idTxtFd.addTarget(self, action: #selector(isValid), for: .editingChanged)
        pwTxtFd.addTarget(self, action: #selector(isValid), for: .editingChanged)
    }
    
    func unableLoginBtn(){
        self.loginBtn.backgroundColor = UIColor.init(red: 187.0/255.0, green: 188.0/255.0, blue: 187.0/255.0, alpha: 1.0)
        self.loginBtn.setTitleColor(grayColor, for: .normal)
        self.loginBtn.isEnabled = false
    }
    func enableLoginBtn(){
        
        self.loginBtn.backgroundColor = UIColor.init(red: 0.0/255.0, green: 157.0/255.0, blue: 76.0/255.0, alpha: 1.0)
        self.loginBtn.setTitleColor(UIColor.white, for: .normal)
        self.loginBtn.isEnabled = true
    }
    
    func login() {
        let model = LoginModel(self)
        let email = gsno(idTxtFd.text)
        let password = gsno(pwTxtFd.text)
        model.login(email: email, password: password)
    }
    func isValid(){
        if !((idTxtFd.text?.isEmpty)! || (pwTxtFd.text?.isEmpty)!) {
            enableLoginBtn()
        }
        else {
            unableLoginBtn()
        }
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        if(touch.view?.isDescendant(of: loginStackView))!{
            return false
        }
        return true
    }
    func handleTap_mainview(_ sender: UITapGestureRecognizer?){
        self.loginStackView.becomeFirstResponder()
        self.loginStackView.resignFirstResponder()

    }
    
    func registerForKeyboardNotifications() {
        NotificationCenter.default.addObserver(self, selector:#selector(keyboardWillShow), name: .UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector:#selector(keyboardWillHide), name: .UIKeyboardWillHide, object: nil)
    }
    func unregisterForKeyboardNotifications() {
        NotificationCenter.default.removeObserver(self, name:.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.removeObserver(self, name:.UIKeyboardWillHide, object: nil)
    }
    
    func keyboardWillShow(notification: NSNotification) {
        if check {
            if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
                backCenterConstrainY.constant = -130
                centerConstraintY.constant = 0
                check = false
                view.layoutIfNeeded()
            }
        }
    }
    func keyboardWillHide(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            centerConstraintY.constant = 130
            backCenterConstrainY.constant = 0
            check = true
            view.layoutIfNeeded()
        }
    }
    
    func networkFailed() {
        simpleAlert(title: "ERROR", msg: "네트워크 연결을 확인하세요.")
    }
    
}
