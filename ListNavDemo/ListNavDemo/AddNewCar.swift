//
//  AddNewCar.swift
//  ListNavDemo
//
//  Created by taemmy on 2021/01/06.
//  Copyright © 2021 tm. All rights reserved.
//

import SwiftUI

struct AddNewCar: View {
    @ObservedObject var carStore : CarStore
    
    @State var isHybrid = false
    @State var name : String = ""
    @State var description : String = ""
    
    
    var body: some View {
        Form{
            Section(header : Text("Car Details")) {
                Image(systemName: "car.fill").resizable().aspectRatio(contentMode: .fit).padding()
                
                DataInput(title: "Model", userInput: $name)
                DataInput(title: "Dscription", userInput: $description)
                
                Toggle(isOn: $isHybrid){
                    Text("Hybrid").font(.headline)
                }.padding()
            }
            Button(action: addNNewCar){
                Text("Add Car")
            }
        }
    }
    func addNNewCar(){
        
        
        let newCar = Car(id: UUID().uuidString, name: name, description: description, isHybrid: isHybrid, imageName: "Test Model_3")
        carStore.cars.append(newCar)
    }
}

struct AddNewCar_Previews: PreviewProvider {
    static var previews: some View {
        AddNewCar(carStore: CarStore(cars:carData))
    }
}
struct DataInput : View {
    var title : String
    @Binding var userInput: String
    
    var body: some View{
        VStack(alignment: HorizontalAlignment.leading){
            Text("Title :\(title)").font(.headline)
            TextField("Enter \(title)", text: $userInput).textFieldStyle(RoundedBorderTextFieldStyle())
        }
        .padding()
    }
}
