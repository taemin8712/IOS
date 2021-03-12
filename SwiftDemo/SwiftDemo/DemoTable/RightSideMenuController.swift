//
//  RightSideMenuController.swift
//  SwiftDemo
//
//  Created by taemmy on 2020/08/26.
//  Copyright © 2020 tm. All rights reserved.
//

import UIKit

class RightSideMenuController: UIViewController {

    public var m_menuList : [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print("RightSideMenuController viewDidLoad m_menuList : \(m_menuList)" )
        // Do any additional setup after loading the view.
    }


    @IBAction func SidemenBtn(_ sender: Any) {
        print("RightSideMenuController Button Event")
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
