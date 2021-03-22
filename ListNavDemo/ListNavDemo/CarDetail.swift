//
//  CarDetail.swift
//  ListNavDemo
//
//  Created by taemmy on 2021/01/06.
//  Copyright © 2021 tm. All rights reserved.
//

import SwiftUI

struct CarDetail: View {
    let selectedCar : Car
    
    var body: some View {
        Form{
            Section(header: Text("Car Detail Infor")){
                Image(selectedCar.imageName)
                    .resizable().cornerRadius(12.0).aspectRatio(contentMode: .fit).padding()
                
                Text("Car name : \(selectedCar.name)").font(.headline)
                Text("Car Description : \(selectedCar.description)")
                
                HStack{
                    Text("Hybrid").font(.headline)
                    Spacer()
                    Image(systemName: selectedCar.isHybrid ? "checkmark.circle" : "xmark.circle")
                }
            }
        }
    }
}

struct CarDetail_Previews: PreviewProvider {
    static var previews: some View {
        CarDetail(selectedCar: carData[0])
    }
}
