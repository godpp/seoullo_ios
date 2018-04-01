//
//  Main_Tab.swift
//  seoullo_ios
//
//  Created by 갓거 on 2017. 10. 18..
//  Copyright © 2017년 갓거. All rights reserved.
//

import Foundation
import UIKit

class Main_Tab : UITabBarController{
    
    @IBInspectable var defaultIndex: Int = 1
    
    override func viewDidLoad() {
        
        selectedIndex = defaultIndex
        
        UITabBar.appearance().barTintColor = UIColor.init(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 0.0)
        var tabBar = self.tabBar
        
        var mainImage = UIImage(named:"icon_home.png")?.withRenderingMode(.alwaysOriginal)
        var infoImage = UIImage(named: "tabbar_information.png")?.withRenderingMode(.alwaysOriginal)
        var hashImage = UIImage(named: "tabbar_camera.png")?.withRenderingMode(.alwaysOriginal)
        
        (tabBar.items![0] as! UITabBarItem).image = infoImage
        (tabBar.items![1] as! UITabBarItem).image = mainImage
        (tabBar.items![2] as! UITabBarItem).image = hashImage
        (tabBar.items![0] as! UITabBarItem).selectedImage = infoImage
        (tabBar.items![1] as! UITabBarItem).selectedImage = mainImage
        (tabBar.items![2] as! UITabBarItem).selectedImage = hashImage
        
        (tabBar.items![0] as! UITabBarItem).index(ofAccessibilityElement: 0)
        (tabBar.items![1] as! UITabBarItem).index(ofAccessibilityElement: 1)
        (tabBar.items![2] as! UITabBarItem).index(ofAccessibilityElement: 2)
        
    }
}
