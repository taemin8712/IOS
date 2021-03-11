//
//  SecondView.swift
//  ObservableDemo
//
//  Created by taemmy on 2020/12/21.
//  Copyright © 2020 tm. All rights reserved.
//

import SwiftUI



extension VerticalAlignment{
    private enum OneThird : AlignmentID {
        
        static func defaultValue(in ctxt: ViewDimensions) -> CGFloat {
            return ctxt.height / 3
        }
    }
    static let oneThird = VerticalAlignment(OneThird.self)
}
extension VerticalAlignment {
    private enum MyAlignment: AlignmentID {
        static func defaultValue(in context: ViewDimensions) -> CGFloat {
            context[.bottom]
        }
    }
    static let myAlignmentGuide = VerticalAlignment(MyAlignment.self)
}



struct SecondView: View {
    
    //    @ObservedObject var timerData : TimerData
    @EnvironmentObject var timerData : TimerData
    var body: some View
    {
        //        VStack{
        //            Text("SecondView")
        //                .font(.largeTitle)
        //            Text("Timer count = \(timerData.timeCnt)")
        //
        //        }
        //    .padding()
        
        HStack(alignment:.myAlignmentGuide, spacing: 10){
            Circle().foregroundColor(Color.orange)
                .frame(width: 100, height: 100  )
                .alignmentGuide(.myAlignmentGuide, computeValue: {d in d[VerticalAlignment.center]})
            
            VStack{
                Rectangle()
                    .foregroundColor(Color.green)
                    .frame(width: 100, height: 100)
                
                Rectangle()
                    .foregroundColor(Color.red)
                    .frame(width: 100, height: 100)
                    
                Rectangle()
                    .foregroundColor(Color.blue)
                    .frame(width: 100, height: 100)
                .alignmentGuide(.myAlignmentGuide, computeValue: {d in d[VerticalAlignment.center]})
                Rectangle()
                    .foregroundColor(Color.gray)
                    .frame(width: 100, height: 100)
            }
        }
    }
}

struct SecondView_Previews: PreviewProvider {
    static var previews: some View {
        SecondView().environmentObject(TimerData())
    }
}
