//
//  Join.swift
//  seoullo_ios
//
//  Created by 갓거 on 2017. 10. 3..
//  Copyright © 2017년 갓거. All rights reserved.
//

import Foundation
import UIKit

class JoinVC : UIViewController, UIGestureRecognizerDelegate, NetworkCallback{
    
    @IBOutlet var signupLogo: UIImageView!
    @IBOutlet var signupLabel: UILabel!
    @IBOutlet var dismissBtn: UIButton!
    
    @IBOutlet var nameTxtFd: UITextField!
    @IBOutlet var emailTxtFd: UITextField!
    @IBOutlet var pwTxtFd: UITextField!
    @IBOutlet var confirmPwTxtFd: UITextField!
    
    @IBOutlet var duplicateNameChk: UILabel!
    @IBOutlet var duplicateEmailChk: UILabel!
    @IBOutlet var confirmPwChk: UILabel!
    
    @IBOutlet var joinBtn: UIButton!
    
    @IBOutlet var joinStackView: UIStackView!
    
    var check = true
    
    let grayColor = UIColor.init(red: 127.0/255.0, green: 127.0/255.0, blue: 127.0/255.0, alpha: 1.0)
    
    override func viewDidLoad() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap_mainview(_:)))
        tap.delegate = self
        self.initAddTarget()
        duplicateNameChk.isHidden = true
        duplicateEmailChk.isHidden = true
        confirmPwChk.isHidden = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        UIApplication.shared.statusBarStyle = .lightContent
    }
    override func viewWillAppear(_ animated: Bool) {
        registerForKeyboardNotifications()
    }
    override func viewWillDisappear(_ animated: Bool) {
        UIApplication.shared.statusBarStyle = .default
        unregisterForKeyboardNotifications()
    }
    
    @IBAction func dimissBtn(_ sender: Any) {
        presentingViewController?.dismiss(animated: true)
    }
    
    func networkResult(resultData: Any, code: String) {
        if code == "dup_name_ok" {
            duplicateNameChk.isHidden = true
        }
        else if code == "dup_name_fail" {
            duplicateNameChk.isHidden = false
        }
        if code == "dup_email_ok" {
            duplicateEmailChk.isHidden = true
        }
        else if code == "dup_email_fail" {
            duplicateEmailChk.isHidden = false
        }
        if code == "signup_ok" {
            presentingViewController?.dismiss(animated: true)
        }
        else if code == "signup_fail" {
            simpleAlert(title: "네트워크 오류", msg: "서버가 응답하지 않습니다.")
        }
    }
    
    
    func initAddTarget(){
        joinBtn.addTarget(self, action: #selector(join), for: .touchUpInside)
        nameTxtFd.addTarget(self, action: #selector(isValid), for: .editingChanged)
        nameTxtFd.addTarget(self, action: #selector(duplicateCheck), for: .editingChanged)
        emailTxtFd.addTarget(self, action: #selector(isValid), for: .editingChanged)
        emailTxtFd.addTarget(self, action: #selector(duplicateCheck), for: .editingChanged)
        pwTxtFd.addTarget(self, action: #selector(isValid), for: .editingChanged)
        confirmPwTxtFd.addTarget(self, action: #selector(isValid), for: .editingChanged)
        confirmPwTxtFd.addTarget(self, action: #selector(confirmCheck), for: .editingChanged)
    }
    
    func unablejoinBtn(){
        self.joinBtn.backgroundColor = UIColor.init(red: 187.0/255.0, green: 188.0/255.0, blue: 187.0/255.0, alpha: 1.0)
        self.joinBtn.setTitleColor(grayColor, for: .normal)
        self.joinBtn.isEnabled = false
    }
    func enablejoinBtn(){
        self.joinBtn.backgroundColor = UIColor.init(red: 0.0/255.0, green: 157.0/255.0, blue: 76.0/255.0, alpha: 1.0)
        self.joinBtn.setTitleColor(UIColor.white, for: .normal)
        self.joinBtn.isEnabled = true
    }
    
    
    func isValid(){
        if !((nameTxtFd.text?.isEmpty)! || (pwTxtFd.text?.isEmpty)! || (emailTxtFd.text?.isEmpty)! || (confirmPwTxtFd.text?.isEmpty)!) {
            enablejoinBtn()
        }
        else {
            unablejoinBtn()
        }
    }
    
    func duplicateCheck(_ sender: UITextField) {
        let model = SignupModel(self)
        if sender == nameTxtFd {
            let name = gsno(nameTxtFd.text)
            model.usernameCheck(nickname: name, flag: 1)
        }
        else if sender == emailTxtFd {
            let email = gsno(emailTxtFd.text)
            model.emailCheck(email: email, flag: 2)
        }
    }
    func confirmCheck() {
        if pwTxtFd.text == confirmPwTxtFd.text {
            confirmPwChk.isHidden = true
        }
        else {
            confirmPwChk.isHidden = false
        }
    }
    
    func join() {
        let model = SignupModel(self)
        let nickname = gsno(nameTxtFd.text)
        let email = gsno(emailTxtFd.text)
        let password = gsno(pwTxtFd.text)
        
        model.signup(nickname: nickname, email: email, password: password)
    }
    
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        if (touch.view?.isDescendant(of: nameTxtFd))! || (touch.view?.isDescendant(of: emailTxtFd))! || (touch.view?.isDescendant(of: pwTxtFd))! || (touch.view?.isDescendant(of: confirmPwTxtFd))! {
            return false
        }
        else {
            return true
        }
    }
    func handleTap_mainview(_ sender: UITapGestureRecognizer?){
        self.nameTxtFd.resignFirstResponder()
        self.emailTxtFd.resignFirstResponder()
        self.pwTxtFd.resignFirstResponder()
        self.confirmPwTxtFd.resignFirstResponder()
    }
    
    func registerForKeyboardNotifications() {
        //NotificationCenter.default.addObserver(self, selector:#selector(keyboardWillShow), name: .UIKeyboardWillShow, object: nil)
        //NotificationCenter.default.addObserver(self, selector:#selector(keyboardWillHide), name: .UIKeyboardWillHide, object: nil)
    }
    func unregisterForKeyboardNotifications() {
        //NotificationCenter.default.removeObserver(self, name:.UIKeyboardWillShow, object: nil)
        //NotificationCenter.default.removeObserver(self, name:.UIKeyboardWillHide, object: nil)
    }
    
    func keyboardWillShow(notification: NSNotification) {
        if check {
            if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
                let height = keyboardSize.height - 100
//                signupLogo.isHidden = true
//                signupLabel.isHidden = true
//                dismissBtn.isHidden = true
                joinStackView.frame.origin.y -= height
                check = false
                view.layoutIfNeeded()
            }
        }
    }
    func keyboardWillHide(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            let height = keyboardSize.height - 100
//            signupLogo.isHidden = false
//            signupLabel.isHidden = false
//            dismissBtn.isHidden = false
            joinStackView.frame.origin.y += height
            check = true
            view.layoutIfNeeded()
        }
    }
    func networkFailed() {
        simpleAlert(title: "ERROR", msg: "네트워크 연결을 확인하세요.")
    }
    
}
