//
//  InfoCourseVC.swift
//  seoullo_ios
//
//  Created by 갓거 on 2017. 10. 31..
//  Copyright © 2017년 갓거. All rights reserved.
//

import Foundation
import UIKit

class InfoCourseVC : UIViewController, UITableViewDelegate, UITableViewDataSource{
    var coursetitleArray : [String] = ["남산회현 코스", "중림충정 코스", "청파효창 코스", "서울역통합 코스", "주제별 코스"]
    
    var courseInfoArray : [String] = ["서울의 600년 역사와 함께 자연을 즐길 수 있는 코스", "낡은 멋스러움을 간직한 근대건축물과의 만남이 있는 코스", "오래된 추억만큼 놀라운 사연 가득한 코스", "서울역 서부와 동부를 모두 아우르는 코스", "서울역일대 주제별 도보관광코스 소개"]
    
    var courseURLArray : [String] = ["http://seoullo7017.seoul.go.kr/SSF/H/ENJ/020/04010.do","http://seoullo7017.seoul.go.kr/SSF/H/ENJ/020/05010.do","http://seoullo7017.seoul.go.kr/SSF/H/ENJ/020/06010.do","http://seoullo7017.seoul.go.kr/SSF/H/ENJ/020/07010.do","http://seoullo7017.seoul.go.kr/SSF/J/TL/TCList.do?pageSize=10"]
    
    @IBOutlet var courseTableView: UITableView!
    
    override func viewDidLoad() {
        courseTableView.delegate = self
        courseTableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = courseTableView.dequeueReusableCell(withIdentifier: "CourseCell") as! CourseCell
        
        cell.courseTitle.text = gsno(coursetitleArray[indexPath.row])
        cell.courseInfo.text = gsno(courseInfoArray[indexPath.row])
        cell.courseBtn.isEnabled = false

        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let url = URL(string: gsno(courseURLArray[indexPath.row])) {
            UIApplication.shared.openURL(url)
        }
    }
    
    
}
