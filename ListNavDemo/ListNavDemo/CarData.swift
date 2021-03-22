//
//  CarData.swift
//  ListNavDemo
//
//  Created by taemmy on 2021/01/06.
//  Copyright © 2021 tm. All rights reserved.
//

import Foundation
import SwiftUI

var carData: [Car] = loadJson("carData.json")

func loadJson<T: Decodable> (_ filename: String) -> T {
    let data : Data
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil  )
        else{
            fatalError("\(filename) not found.")
    }
    
    do{
        data = try Data(contentsOf: file)
    }catch{
        fatalError("Could not load file :(error)")
    }
    do{
        return try JSONDecoder().decode(T.self, from: data)
    }catch{
        fatalError("Unable to parse : (error")
    }
}
