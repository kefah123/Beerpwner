//
//  Beer.swift
//  Beerpwner
//
//  Created by Kwasi Efah on 3/28/20.
//  Copyright © 2020 KE. All rights reserved.
//
import UIKit
// The Beer class stores information about an individual beer
class Beer: NSObject, NSCoding {
    var name: String
    var valueInDollars: Int
    var brewery: String
    var address: String
    let dateCreated: Date

    func encode(with aCoder: NSCoder) {
    aCoder.encode(name, forKey: "name")
    aCoder.encode(dateCreated, forKey: "dateCreated")
    aCoder.encode(brewery, forKey: "brewery")
    aCoder.encode(address, forKey: "address")
    aCoder.encode(valueInDollars, forKey: "valueInDollars")
    }
    
    required init(coder aDecoder: NSCoder) {
    name = aDecoder.decodeObject(forKey: "name") as! String
    dateCreated = aDecoder.decodeObject(forKey: "dateCreated") as! Date
    brewery = aDecoder.decodeObject(forKey: "brewery") as! String
    address = aDecoder.decodeObject(forKey: "address") as! String
    valueInDollars = aDecoder.decodeInteger(forKey: "valueInDollars")
    super.init()
    }

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

