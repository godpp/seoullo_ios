//
//  WriteHugiVC.swift
//  seoullo_ios
//
//  Created by 갓거 on 2017. 10. 21..
//  Copyright © 2017년 갓거. All rights reserved.
//

import Foundation
import UIKit
import KMPlaceholderTextView

protocol DoneDelegate{
    func DoneDone()
}

class WriteHugiVC : UIViewController, NetworkCallback{
    
    @IBOutlet var placenameLabel: UILabel!
    @IBOutlet var writerLabel: UILabel!
    
    @IBOutlet var titleTextField: UITextField!
    @IBOutlet var contentTextView: KMPlaceholderTextView!
    @IBOutlet var photoUploadBtn: UIButton!
    
    var placename : String?
    var writer : String?
    var placeid : Int?
    var token : String?
    var delegate : DoneDelegate?

    
    let picker = UIImagePickerController()
    
    
    @IBAction func photoUploadBtn(_ sender: UIButton) {
        present(picker, animated: true, completion: nil)
    }
    
    @IBAction func XBtn(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func registerBtn(_ sender: UIButton) {
        
        let title = gsno(titleTextField.text)
        let content = gsno(contentTextView.text)
        let model = WriteHugiModel(self)
        
        
        
        if title == "" || content == ""{
            simpleAlert(title: "ERROR", msg: "모두 채워주세요!")
        }
        else {
            var getImage = photoUploadBtn.imageView?.image
            let placeimage = UIImageJPEGRepresentation(getImage!, 0.5)

            model.writehugiModel(placeid: gino(placeid), content: content, title: title, placeimage: placeimage, token:gsno(token))
            self.delegate?.DoneDone()
            simpleAlertt(title: "", msg: "등록하시겠습니까?")
            
        }
        
    }
    
    func simpleAlertt(title: String, msg: String) {
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인", style: .default) { (UIAlertAction) in
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "load"), object: nil)
 
            self.dismiss(animated: false, completion: nil)
        }
        let cancelAction = UIAlertAction(title: "취소", style: .cancel)
        alert.addAction(cancelAction)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    override func viewDidLoad() {
        picker.allowsEditing = false
        picker.delegate = self
        
        placenameLabel.text = gsno(placename)
        writerLabel.text = " 글쓴이 : " + gsno(writer)
    }
    
    
    func networkResult(resultData: Any, code: String) {
        if code == "6"{
            
        }
    }
    func networkFailed() {
        simpleAlert(title: "ERROR", msg: "네트워크 연결 오류")
    }
}

extension WriteHugiVC : UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    //사진 선택 안하고 종료 시
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    //사진 선택 관련 컨트롤러
    //이미지 피커 컨트롤러에서 이미지를 선택하거나 카메라 촬영을 완료 했을 때, 호출되는 메소드입니다 만약 선택한 이미지에 대한 수정 옵션이 설정되어 있다면 이미지 수정 작업이 완료되었을 때 호출됩니다.
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        var newImage: UIImage
        
        if let possibleImage = info["UIImagePickerControllerEditedImage"] as? UIImage {
            // UIImagePickerControllerEditedImage 이미지가 수정된 경우 수정된 이미지를 전달합니다
            //이미지를 이미지뷰(newImage) 에 표시
            newImage = possibleImage

        } else if let possibleImage = info["UIImagePickerControllerOriginalImage"] as? UIImage {
            //UIImagePickerControllerOriginalImage 는 이미지 피커 컨트롤러에서 선택한 이미지에 대한 원본 이미지 데이터입니다. 이미지가 수정되었더라도 이 키를 이용하면 원본 데이터를 받을 수 있습니다.
            
            //이미지를 미지뷰(newImage)에 표시
            newImage = possibleImage
        } else {
            return
        }
        photoUploadBtn.setImage(newImage, for: .normal)
        
        dismiss(animated: true, completion: nil)
    }
}
