//
//  ViewController.swift
//  SideBarTM
//
//  Created by taemmy on 2021/01/25.
//  Copyright © 2021 tm. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var contentVC : UIViewController? //tm_front
    var sideVC : UIViewController? //tm_side
    
    var isSideBarShowing = false
    let SLIDE_TIME = 0.3
    let SIDEBAR_WIDTH : CGFloat = 260

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setuㅌp after loading the view.
        self .setupView()
    }
    
    func setupView(){
        if let vc = self.storyboard?.instantiateViewController(withIdentifier: "tm_front") as? UINavigationController {
            
            let frontVC = vc.viewControllers[0] as? FrontViewController
            frontVC?.delegate = self
            self.contentVC = vc
            self.addChild(vc)
            self.view.addSubview(vc.view)
            
            //front 컨트롤러에 부모 뷰 컨토럴가 바뀌였음을 알려준다.
            vc.didMove(toParent: self)
        }
    }
    func getSideView(){
     //사이드 바 객체. 확인
        guard self.sideVC == nil else{
            return
        }
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "tm_side") else{
            return
        }
        
        let backVC = vc as? SideViewController
        backVC?.delegate = self
        
        self.sideVC = vc
        self.addChild(vc)
        self.view.addSubview(vc.view)
        vc.didMove(toParent: self)
        self.view.bringSubviewToFront((self.contentVC?.view)!)
    }
    func setShadowEffect(shodow: Bool, offset : CGFloat){
        if (shodow == true){
            self.contentVC?.view.layer.masksToBounds = false
            self.contentVC?.view.layer.cornerRadius = 10
            self.contentVC?.view.layer.shadowOpacity = 0.9
            self.contentVC?.view.layer.shadowColor = UIColor.black.cgColor
            self.contentVC?.view.layer.shadowOffset = CGSize(width: offset, height: offset)
        }
        else{
            self.contentVC?.view.layer.cornerRadius = 0.0
            self.contentVC?.view.layer.shadowOffset = CGSize(width: 0, height: 0)
        }
    }
    func openSideBar(_ complete: ( () -> Void)? ) {
        self.getSideView()
        self.setShadowEffect(shodow: true, offset: -2)
        
        let options = UIView.AnimationOptions([.curveEaseInOut, .beginFromCurrentState])
        
        //MARK: Value of type '(CGRect) -> CGRect' has no member 'height' WHY?
        UIView.animate(withDuration: TimeInterval(self.SLIDE_TIME), delay: TimeInterval(0), options: options, animations: {
            self.contentVC?.view.frame = CGRect(x:self.SIDEBAR_WIDTH, y:0, width:self.view.frame.width, height:self.view.frame.height)
        }, completion:{
            if $0 == true {
                self.isSideBarShowing = true
                complete?()
                }
            }
        )
        
    }
    // 사이드 바를 닫는다.
    func closeSideBar(_ complete: ( () -> Void)? ) {
      // 애니메이션 옵션을 정의한다.
        let options = UIView.AnimationOptions([.curveEaseInOut, .beginFromCurrentState])
      // 애니메이션 실행
      UIView.animate(
        withDuration: TimeInterval(self.SLIDE_TIME),
        delay: TimeInterval(0),
        options: options,
        animations: {
          // ① 옆으로 밀려난 콘텐츠 뷰의 위치를 제자리로
          self.contentVC?.view.frame = CGRect(x:0, y:0, width:self.view.frame.width, height:self.view.frame.height)
        },
        completion: {
          if $0 == true {
            // ② 사이드 바 뷰를 제거한다.
            self.sideVC?.view.removeFromSuperview()
            self.sideVC = nil
            // ③ 닫힘 상태로 플래그를 변경한다.
            self.isSideBarShowing = false
            // ④ 그림자 효과를 제거한다.
            self.setShadowEffect(shodow: false, offset: 0)
            // ⑤ 인자값으로 입력받은 완료 함수를 실행한다.
            complete?()
          }
      }
      )
    }


    func sideMenuEvent(_ sender : Any){
        print("\(sender)")
    }
}

