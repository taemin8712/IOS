//
//  HTButton.swift
//  SwiftDemo
//
//  Created by taemmy on 2020/08/27.
//  Copyright © 2020 tm. All rights reserved.
//

import UIKit

class HTButton: UIButton {
    
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
    override init(frame: CGRect) {
        super.init(frame : frame)
        configure()
        print("init with frame")
    }
    
    required init?(coder: NSCoder) {
        print("init with nscoder")
        super.init(coder: coder)
        
        setTitle("Custom Button", for: .normal)
        
        
    }
    
    convenience init (bgcolor : UIColor, title : String){
        self.init(frame : .zero)
        setTitle(title, for: .normal)
        backgroundColor = bgcolor
    }
    
    
    private func configure() {
        layer.cornerRadius = 10
        translatesAutoresizingMaskIntoConstraints = false
    }
    // MARK: - Apperance
    private func setShadow(){
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0.0, height: 5.0)
        layer.shadowRadius = 5
        layer.shadowOpacity = 0.5
        clipsToBounds = true
        layer.masksToBounds = false
    }
    
    
    // MARK: - Event
    private func eventShake(direction: Bool){
        let shakeKey = "position"
        let shake = CABasicAnimation(keyPath: shakeKey)
        shake.duration = 0.2
        shake.repeatCount = 3
        shake.autoreverses = true
        
        let fromPoint, toPoint : CGPoint
        let fromValue, toValue : NSValue
        
        if direction {
            fromPoint  = CGPoint(x: self.center.x - 8, y: self.center.y )
            fromValue  = NSValue(cgPoint: fromPoint)
            
            toPoint    = CGPoint(x: self.center.x + 8, y: self.center.y )
            toValue    = NSValue(cgPoint: toPoint)
        }
        else{
            fromPoint = CGPoint(x: self.center.x - 8, y: self.center.y )
            fromValue = NSValue(cgPoint: fromPoint)
            
            toPoint  = CGPoint(x: self.center.x + 8, y: self.center.y )
            toValue    = NSValue(cgPoint: toPoint)
        }
        
        shake.fromValue = fromValue
        shake.toValue = toValue
        layer.add(shake, forKey: shakeKey)
    }
    
}
