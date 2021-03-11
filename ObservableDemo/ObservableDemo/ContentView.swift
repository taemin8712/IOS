//
//  ContentView.swift
//  ObservableDemo
//
//  Created by taemmy on 2020/12/21.
//  Copyright © 2020 tm. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
//    @ObservedObject var timerData : TimerData = TimerData()
    
    
    @EnvironmentObject var timerData : TimerData

    
    var body: some View {
        NavigationView{
            VStack{
                Text("Timer count = \(timerData.timeCnt)")
                
                
                Button(action: resetCount){
                    Text("Reset Count")
                }
                NavigationLink(destination: ListView()){
                    Text("Next Screen")
                }
            .padding()
            }
        }
    }
    func resetCount() {
        timerData.resetCnt()
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(TimerData())
    }
}
