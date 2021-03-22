//
//  ContentView.swift
//  ListNavDemo
//
//  Created by taemmy on 2021/01/06.
//  Copyright © 2021 tm. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    //JsonData load from cardata.json
    @ObservedObject var carStore : CarStore = CarStore(cars: carData)
    
    var body: some View {
        NavigationView{
            List{
                ForEach(carStore.cars){
                    car in
                    ListView(car: car)
                }
                .onDelete(perform: deleItems )
                .onMove(perform: moveItems )
            }
            .navigationBarTitle("EV Cars")
            .navigationBarItems(leading: NavigationLink(destination:AddNewCar(carStore: self.carStore)){
                Text("Add").foregroundColor(.blue)
            }, trailing: EditButton())
        }
    }
    func deleItems(at removeIndex: IndexSet){
        
        carStore.cars.remove(atOffsets: removeIndex)
        
    }
    func moveItems(from source: IndexSet, to destination: Int){
        carStore.cars.move(fromOffsets: source, toOffset: destination)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ListView: View {
    var car: Car
    var body: some View {
        NavigationLink(destination: CarDetail(selectedCar: car)){
            HStack
                {
                    Image(car.imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100, height: 100)
                    Text("car name : \(car.name)")
            }
        }
    }
}
