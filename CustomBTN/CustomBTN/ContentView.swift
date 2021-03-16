//
//  ContentView.swift
//  CustomBTN
//
//  Created by taemmy on 2020/08/11.
//  Copyright © 2020 tm. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        
        VStack(spacing : 30){
            Button(action: {
               print("Button Click")
            }, label: {
                Text("Tab")
            }).buttonStyle(CustomButtonStyle(color: Color.pink, type: .tab))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
