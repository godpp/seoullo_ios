//
//  InfoVC.swift
//  seoullo_ios
//
//  Created by 갓거 on 2017. 10. 19..
//  Copyright © 2017년 갓거. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import AlamofireObjectMapper
import ObjectMapper
import SwiftSoup
import SDWebImage

class InfoVC : UIViewController, UITableViewDelegate, UITableViewDataSource{
    

    @IBOutlet var eventTableView: UITableView!
    @IBOutlet var programView: UIView!
    @IBOutlet var courseView: UIView!


    @IBOutlet var segmentedControl: UISegmentedControl!
    
    var eventingTitleArray : [String] = ["[2017 서울로 워킹데이] 서울로에서 남산까지"]
    var eventingTimeArray : [String] = ["2017. 11. 11.(토) 09:00~12:00"]
    var eventedTitleArray : [String] = ["2017 서울로 여름축제 '서울로 go'","'서울로 100일의 자연' 전시회"]
    var eventedTimeArray : [String] = ["2017년 7월 21일 ~ 7월 30일","2017년 8월 26일(토) ~ 9월 1일(금)"]
    var urlingArray : [String] = ["http://seoullo7017.seoul.go.kr/SSF/H/MAN/020/02010.do"]
    var urledArray : [String] = ["http://seoullo7017.seoul.go.kr/SSF/H/MAN/020/02010_02.do", "http://seoullo7017.seoul.go.kr/SSF/H/MAN/020/02010_03.do"]
    
    
    @IBAction func segmentedControl(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0{
            eventTableView.isHidden = false
            programView.isHidden = true
            courseView.isHidden = true
        }
        else if sender.selectedSegmentIndex == 1{
            eventTableView.isHidden = true
            programView.isHidden = true
            courseView.isHidden = false
        }
        else {
            eventTableView.isHidden = true
            programView.isHidden = false
            courseView.isHidden = true
        }

    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if (0 == section){
            return "진행중인 이벤트"
        }
        else{
            return "지난 이벤트"
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            return eventingTitleArray.count
        }
        else {
            return eventedTitleArray.count
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = eventTableView.dequeueReusableCell(withIdentifier: "EventCell") as! EventCell
        
        if(indexPath.section == 0){
            cell.eventTitleCell.text = gsno(eventingTitleArray[indexPath.row])
            cell.eventTimeCell.text = gsno(eventingTimeArray[indexPath.row])

            return cell
        }
        else {
            cell.eventTitleCell.text = gsno(eventedTitleArray[indexPath.row])
            cell.eventTimeCell.text = gsno(eventedTimeArray[indexPath.row])
            return cell
        }

    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0{
            if let url = URL(string: urlingArray[indexPath.row]) {
                UIApplication.shared.openURL(url)
            }
        }
        else {
            if let url = URL(string: urledArray[indexPath.row]) {
                UIApplication.shared.openURL(url)
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //네비바 설정
        let bar:UINavigationBar! =  self.navigationController?.navigationBar
        bar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.init(red: 0/255, green: 157/255, blue: 76/255, alpha: 1)]
        self.navigationItem.title = "1km, 서울로7017"
    }
    
    override func viewDidLoad() {
        eventTableView.isHidden = false
        programView.isHidden = true
        courseView.isHidden = true
        
        eventTableView.delegate = self
        eventTableView.dataSource = self
        
        segmentedControl.backgroundColor = UIColor.white
        segmentedControl.tintColor = UIColor.clear
        segmentedControl.setTitle("이벤트", forSegmentAt: 0)
        segmentedControl.setTitle("도시관광코스", forSegmentAt: 1)
        segmentedControl.setTitle("상설프로그램", forSegmentAt: 2)
        segmentedControl.setTitleTextAttributes([NSForegroundColorAttributeName : UIColor.white], for: .selected)
        segmentedControl.setTitleTextAttributes([NSForegroundColorAttributeName : UIColor.init(red: 69/255.0, green: 154/255.0, blue: 85/255.0, alpha: 1.0)], for: .normal)
        segmentedControl.setBackgroundImage(UIImage(named:"mypage_segment_white.png"), for: .normal, barMetrics: UIBarMetrics.default)
        segmentedControl.setBackgroundImage(UIImage(named: "mypage_segment_green.png"), for: .selected, barMetrics: UIBarMetrics.default)
        segmentedControl.frame = CGRect(x: 0, y: 64, width: 375, height: 40)
        
        
        //네비바 설정
        let bar:UINavigationBar! =  self.navigationController?.navigationBar
        bar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.init(red: 0/255, green: 157/255, blue: 76/255, alpha: 1)]
        
        
    }
}
