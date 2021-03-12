//
//  SideMenuController.swift
//  SwiftDemo
//
//  Created by taemmy on 2020/08/26.
//  Copyright © 2020 tm. All rights reserved.
//

import UIKit

class SideMenuController: UIViewController {
    
    public var m_menuList : [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("SideMenuController viewDidLoad m_menuList : \(m_menuList)" )
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onSideBTn(_ sender: Any) {
        print("SideMenuController Button Event")
    }
    
    func isShowing(isShow : Bool, showView : UIView){
        UIView.animate(withDuration: 1.0) {
            if isShow {
                showView.frame = CGRect(x: -showView.frame.width, y: 74, width: showView.frame.width, height: showView.frame.height)
            }
            else{
                showView.frame = CGRect(x: 0.0, y: 74, width: showView.frame.width, height: showView.frame.height)
            }
        }
        
    }
    func setContraint(){
        view.topAnchor.constraint(equalTo: super.view.topAnchor, constant: 0).isActive = true
        view.bottomAnchor.constraint(equalTo: super.view.bottomAnchor, constant: 0).isActive = true
        view.leadingAnchor.constraint(equalTo: super.view.leadingAnchor, constant: 0).isActive = true
        view.trailingAnchor.constraint(equalTo: super.view.trailingAnchor, constant: 0).isActive = true
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
