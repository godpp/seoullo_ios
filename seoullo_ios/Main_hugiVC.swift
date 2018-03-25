//
//  Main_hugiVC.swift
//  seoullo_ios
//
//  Created by 갓거 on 2017. 10. 21..
//  Copyright © 2017년 갓거. All rights reserved.
//

import Foundation
import UIKit
import ESPullToRefresh

class Main_hugiVC : UIViewController, UITableViewDelegate, UITableViewDataSource, NetworkCallback{

    var hugiShowArray : [HugiShowItemVO] = []
    var id = Int.max
    var placeid : Int?
    let ud = UserDefaults.standard
    
    
    @IBOutlet var hugiTableView: UITableView!
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hugiShowArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = hugiTableView.dequeueReusableCell(withIdentifier: "HugiCell") as!  HugiCell
        var row = hugiShowArray[indexPath.row]

        
        // 날짜 형식 변환
        let format = DateFormatter()
        var date = Date(timeIntervalSince1970: (TimeInterval(gino(row.written_time)/1000)))
        format.timeZone = NSTimeZone.local
        format.dateFormat = "yyyy.MM.dd"
        let dateString = format.string(from: date)
        
        var last = hugiShowArray.last
        id = gino(last?.article_id)

        cell.hugiImgView.imageFromUrl(gsno(row.place_picture), defaultImgPath: "review_greenbox_squre.png")
        cell.hugiTitleLabel.text = gsno(row.title)
        cell.hugiWriterLabel.text = gsno(row.nickname)
        cell.hugiLabel.text = gsno(row.content)
        cell.hugiTimeLabel.text = gsno(dateString)
        
        return cell
    }
    
    override func viewWillAppear(_ animated: Bool) {
        hugiTableView.delegate = self
        hugiTableView.dataSource = self
        NotificationCenter.default.addObserver(self, selector: #selector(loadList), name: NSNotification.Name(rawValue: "load"), object: nil)
        let model = DetailModel(self)
        model.hugiModel(placeid: gino(placeid), id: Int.max)
        hugiTableView.reloadData()

    }
    override func viewDidAppear(_ animated: Bool) {
        hugiTableView.reloadData()
    }
    
    override func viewDidLoad() {
        hugiTableView.tableFooterView = UIView.init(frame : CGRect.zero)
        hugiTableView.estimatedRowHeight = 100.0
        hugiTableView.rowHeight = UITableViewAutomaticDimension
        
    }
    func loadList(){
        DispatchQueue.main.async(execute: { self.hugiTableView.reloadData() });
    }
    
    func DoneDone(){
        let model = DetailModel(self)
        model.hugiModel(placeid: gino(placeid), id: Int.max)
        hugiTableView.reloadData()
    }
    
    func networkResult(resultData: Any, code: String) {
        if code == "3"{
            hugiShowArray += resultData as! [HugiShowItemVO]

            //테이블 뷰 아래로 리로딩
            self.hugiTableView.es.addInfiniteScrolling {
                [unowned self] in
                let model = DetailModel(self)
                model.hugiModel(placeid: self.gino(self.placeid), id: self.id)
                if ((self.hugiShowArray.last == nil)){
                    self.hugiTableView.es.stopLoadingMore()
                }
                else{
                    self.hugiTableView.es.noticeNoMoreData()
                }
            }
            hugiTableView.reloadData()
        }
        else{
            let err = resultData as? String
            simpleAlert(title: "ERROR", msg: err!)
        }
    }
    func networkFailed() {
        simpleAlert(title: "ERROR", msg: "네트워크 연결을 확인하세요.")
    }
}
