//
//  Car.swift
//  ListNavDemo
//
//  Created by taemmy on 2021/01/06.
//  Copyright © 2021 tm. All rights reserved.
//

import Foundation

struct Car : Codable, Identifiable {
    var id : String
    var name : String
    var description : String
    var isHybrid : Bool
    var imageName : String
}
