//
//  ContentView.swift
//  ContextMenuDemo
//
//  Created by taemmy on 2021/01/07.
//  Copyright © 2021 tm. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var foregroundColor: Color = Color.black
    @State private var backgroundColor: Color = Color.white
    
    var body: some View {
        
//        Myshape().fill(Color.red)
//            .frame(width: 360, height: 350)
        VStack{
        Text("Text1").modifier(StandardTitle())
            
            Button(action: {
                print("click button")
            }, label: {
                /*@START_MENU_TOKEN@*/Text("Button")/*@END_MENU_TOKEN@*/
            }).buttonStyle(PlainButtonStyle())
            
            Button(action: {
                print("click button")
            }, label: {
                /*@START_MENU_TOKEN@*/Text("Button")/*@END_MENU_TOKEN@*/
            }).buttonStyle(NeumorphicButtonStyle(bgColor: .purple))
            
            
        }
        
//        Path{
//            path in
//            path.move(to: CGPoint(x: 10, y: 0))
//
//            path.addLine(to: CGPoint(x: 10, y: 350))
//            path.addLine(to: CGPoint(x: 300, y: 300))
//            path.closeSubpath()
//        }
//
//        VStack {
//            Text("Change Color")
//                           .padding()
//                           .contextMenu {
//                               Button(action: {
//                                   self.backgroundColor = .red
//                               }) {
//                                   Text("Red")
//                               }
//
//                               Button(action: {
//                                   self.backgroundColor = .green
//                               }) {
//                                   Text("Green")
//                               }
//
//                               Button(action: {
//                                   self.backgroundColor = .blue
//                               }) {
//                                   Text("Blue")
//                               }
//                           }
//
//            Text("Hello, World")
//                .font(.largeTitle)
//                .padding()
//                .foregroundColor(foregroundColor)
//                .background(backgroundColor)
//                .contextMenu {
//                    Button(action: {
//                        self.foregroundColor = .black
//                        self.backgroundColor = .white
//                    }) {
//                        Text("Normal Color")
//                    }
//
//                    Button(action : {
//                        self.foregroundColor = .white
//                        self.backgroundColor = .black
//                    }) {
//                        Text("Inverted Colors")
//                    }
//            }
//        }
        
    }
}

struct  Myshape: Shape {
    func path(in rect: CGRect ) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x:rect.minX, y: rect.minY))
        path.addQuadCurve(to: CGPoint(x: rect.minX, y: rect.maxY), control: CGPoint(x: rect.midX, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.closeSubpath()
        
        return path
    }
}
struct StandardTitle : ViewModifier{
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .background(Color.white)
            .border(Color.gray,width: 0.2)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct NeumorphicButtonStyle: ButtonStyle {
    var bgColor: Color

    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding(20)
            .background(
                ZStack {
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .shadow(color: .white, radius: configuration.isPressed ? 7: 10,
                                x: configuration.isPressed ? -5: -15, y: configuration.isPressed ? -5: -15)
                        .shadow(color: .black, radius: configuration.isPressed ? 7: 10, x: configuration.isPressed ? 5: 15, y: configuration.isPressed ? 5: 15)
                        .blendMode(.overlay)
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .fill(bgColor)
                }
        )
            .scaleEffect(configuration.isPressed ? 0.95: 1)
            .foregroundColor(.primary)
            .animation(.spring())
    }
}
