//
//  Beer.swift
//  Beerpwner
//
//  Created by Kwasi Efah on 3/28/20.
//  Copyright © 2020 KE. All rights reserved.
//
import UIKit
// The Beer class stores information about an individual beer
class Beer: NSObject {
    var name: String
    var valueInDollars: Int
    var brewery: String
    var address: String



    init(name: String, brewery: String, valueInDollars: Int, address: String) {
    self.name = name
    self.valueInDollars = valueInDollars
    self.brewery = brewery
    self.address = address
    super.init()
 }
    /*
    convenience init(random: Bool = false) {
        if random {
            let myBeers = ["Conehead", "Little Wolf", "Naragansett"]
            let breweries = ["Zero Gravity","Zero Gravity","Naragansett Brewering Company"]
            let addresses = ["Burlington,VT", "Burlington,Vt", "Cranston,Rhode Island"]
            let prices = [5,6,4]
            self.init(name: randomName, serialNumber: randomSerialNumber, valueInDollars: randomValue)
            } else {
            self.init(name: "", serialNumber: nil, valueInDollars: 0) }
            }*/
}

