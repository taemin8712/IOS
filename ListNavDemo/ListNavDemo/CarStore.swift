//
//  CarStore.swift
//  ListNavDemo
//
//  Created by taemmy on 2021/01/06.
//  Copyright © 2021 tm. All rights reserved.
//

import Foundation
import Combine

class CarStore : ObservableObject {
    @Published var cars : [Car]
    
    init(cars : [Car] = []) {
        self.cars = cars
    }
}
