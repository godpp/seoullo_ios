//
//  ProofShotVC.swift
//  seoullo_ios
//
//  Created by 갓거 on 2017. 10. 26..
//  Copyright © 2017년 갓거. All rights reserved.
//

import Foundation
import UIKit
import SDWebImage
import ESPullToRefresh

class ProofShotVC : UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, NetworkCallback{
    @IBOutlet var ProofCollecView: UICollectionView!
    
    var picture : [ProofShotVO] = []
    var id = Int.max
    override func viewDidLoad() {
        //네비바 설정
        let bar:UINavigationBar! =  self.navigationController?.navigationBar
        bar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.init(red: 0/255, green: 157/255, blue: 76/255, alpha: 1)]
        self.navigationItem.title = "1km, 서울로7017"
        
        ProofCollecView.delegate = self
        ProofCollecView.dataSource = self
    }
    override func viewWillAppear(_ animated: Bool) {
        let model = ProofShotModel(self)
        model.proofshot(id: id)
        
        ProofCollecView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return picture.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = ProofCollecView.dequeueReusableCell(withReuseIdentifier: "ProofShotCell", for: indexPath) as! ProofShotCell
        var row = picture[indexPath.row]

        cell.proofshotImg.imageFromUrl(row.place_picture, defaultImgPath: "review_greenbox_squre.png")
        
        return cell
    }
    func networkResult(resultData: Any, code: String) {
        picture = resultData as! [ProofShotVO]
        
//        //테이블 뷰 아래로 리로딩
//        self.ProofCollecView.es.addInfiniteScrolling {
//            [unowned self] in
//            let model = ProofShotModel(self)
//            model.proofshot(id: self.id)
//            if ((self.ProofCollecView == nil)){
//                self.ProofCollecView.es.stopLoadingMore()
//            }
//            else{
//                self.ProofCollecView.es.noticeNoMoreData()
//            }
//        }
        ProofCollecView.reloadData()
    }
    func networkFailed() {
        simpleAlert(title: "ERROR", msg: "네트워크 연결 오류")
    }
}
