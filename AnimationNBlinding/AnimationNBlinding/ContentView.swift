//
//  ContentView.swift
//  AnimationNBlinding
//
//  Created by taemmy on 2021/01/07.
//  Copyright © 2021 tm. All rights reserved.
//

import SwiftUI


struct ContentView: View {
    
    @State private var visibility = false

    var body: some View {
        
//        VStack{
//            Toggle(isOn: $visibility.animation(.linear(duration: 5))){
//                Text("Toggle Text Views")
//            }.padding()
//
//
//            if visibility {
//                Text("Hellow World")
//            }else{
//                Text("GoodBye World")
//            }
//        }
//        ZStack{
//            Circle()
//            .stroke(lineWidth: 2)
//                .foregroundColor(Color.blue)
//            .frame(width: 360, height: 360)
//            Image(systemName: "forwrad.fill")
//                .font(.largeTitle)
//                .offset(y: -180)
//        }
        VStack{
            Toggle(isOn:$visibility.animation(.linear(duration: 2))){
                Text("Show / Hide Button")
            }.padding()
            
            if visibility {
                     Button(action: {}) {
                         Text("Example Button")
                     }.font(.largeTitle)
                        .transition(.move(edge: .top))
                 }
            
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
