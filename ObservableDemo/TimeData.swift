//
//  TimeData.swift
//  ObservableDemo
//
//  Created by taemmy on 2020/12/21.
//  Copyright © 2020 tm. All rights reserved.
//

import Foundation
import Combine

class TimerData : ObservableObject {
    @Published var timeCnt  = 0
    var timer : Timer?
    
    init() {
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timerDidFire), userInfo: nil, repeats: true)
    }
    
    @objc func timerDidFire(){
        timeCnt += 1
    }
    
    func resetCnt()  {
        timeCnt = 0
    }
    
}





