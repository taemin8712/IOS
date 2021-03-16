//
//  CustomButtonStyle.swift
//  CustomBTN
//
//  Created by taemmy on 2020/08/11.
//  Copyright © 2020 tm. All rights reserved.
//

import SwiftUI

enum ButtonType{
    case tab
    case long
//    case tab, long
}

struct CustomButtonStyle : ButtonStyle {
    
    var color : Color
    var type : ButtonType
    
    
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
        .font(.system(size: 14))
        .padding()
        .background(color)
        .rotationEffect(configuration.isPressed ? .degrees(90.0) : .degrees(0.0))
        .cornerRadius(20)
        .foregroundColor(Color.white)
            .scaleEffect(configuration.isPressed ? 1.3 : 1.0)
            .onTapGesture {
                if (self.type == .tab){
                    let haptic = UIImpactFeedbackGenerator(style: .light)
                    haptic.impactOccurred()
                }
        }.onLongPressGesture {
            if (self.type == .tab){
                let haptic = UIImpactFeedbackGenerator(style: .heavy)
                haptic.impactOccurred()
            }
        }
    }
}

struct CustomButtonStyle_Preview: PreviewProvider  {
    static var previews: some View{
        Button(action: {
            print("Hahaha")
        }, label: {
            Text("Click me! ")
            }
        ).buttonStyle(CustomButtonStyle(color: Color.blue, type: .tab))
        
    }
}

//extension UIColor{
//    var rbga: (red: CGFloat, green: CGFloat, blue: CGFloat, alpha : CGFloat){
//        var red: CGFloat = 0
//        var green: CGFloat = 0
//        var blue: CGFloat = 0
//        var alpha: CGFloat = 0
//
//        getRed(&red, green: &green, blue: &blue, alpha: &alpha)
//
//        return (red, green, blue, alpha)
//
//    }

//    convenience init(red: CGFloat, green: CGFloat, blue: CGFloat){
//        let newRed  = CGFloat(red)
//        let newGreen = CGFloat(green)
//        let newBlue = CGFloat(blue)
//
//        self.init(red:newRed, green: newGreen, blue: newBlue, alpha: 1.0)
//    }
//}
//
