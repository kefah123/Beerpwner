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
    let dateCreated: Date



    init(name: String, brewery: String, valueInDollars: Int, address: String) {
    self.name = name
    self.valueInDollars = valueInDollars
    self.brewery = brewery
    self.address = address
    self.dateCreated = Date()
    super.init()
 }
    
    convenience init(random: Bool = false) {
        if random {
            let myBeers = ["Conehead", "Little Wolf", "Naragansett"]
            let breweries = ["Zero Gravity","Zero Gravity","Naragansett Brewering Company"]
            let addresses = ["Burlington,VT", "Burlington,Vt", "Cranston,Rhode Island"]
            let prices = [5,6,4]
            let idx = arc4random_uniform(UInt32(myBeers.count))
            self.init(name: myBeers[Int(idx)], brewery: breweries[Int(idx)], valueInDollars: prices[Int(idx)], address: addresses[Int(idx)])
        } else {
            self.init(name: "", brewery: "", valueInDollars: 0, address: "") }
            }
}

