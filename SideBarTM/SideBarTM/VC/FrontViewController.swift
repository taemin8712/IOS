//
//  FrontViewController.swift
//  SideBarTM
//
//  Created by taemmy on 2021/01/25.
//  Copyright © 2021 tm. All rights reserved.
//

import SwiftUI

class FrontViewController: UIViewController {
    var delegate : ViewController?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let btnSideBar = UIBarButtonItem(image: UIImage(named: "sidemenu.png"), style: UIBarButtonItem.Style.plain, target: self, action: #selector(moveSide(_:)))
        
        self.navigationItem.leftBarButtonItem = btnSideBar
        
        
        let dragLeft = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(moveSide(_:)))
        dragLeft.edges = UIRectEdge.left
        self.view.addGestureRecognizer(dragLeft)
        
    
           let dragRight = UISwipeGestureRecognizer( target: self, action: #selector(moveSide))
           dragRight.direction = .left // 방향은 왼쪽
           self.view.addGestureRecognizer(dragRight) // 뷰에 제스처 객체를 등록

        
    }
    @objc func moveSide(_ sender: Any)
    {
        
         if sender is UIScreenEdgePanGestureRecognizer {
             self.delegate?.openSideBar(nil)
           } else if sender is UISwipeGestureRecognizer {
             self.delegate?.closeSideBar(nil)
           } else if sender is UIBarButtonItem {
             if self.delegate?.isSideBarShowing == false {
               self.delegate?.openSideBar(nil) // 사이드 바를 연다.
             } else {
               self.delegate?.closeSideBar(nil)// 사이드 바를 닫는다.
             }
           }
    }
}
