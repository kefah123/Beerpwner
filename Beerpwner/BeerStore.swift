//
//  BeerStore.swift
//  Beerpwner
//
//  Created by Kwasi Efah on 3/28/20.
//  Copyright © 2020 KE. All rights reserved.
//

import UIKit
class BeerStore {
    var allBeers = [Beer]()
    let beerArchiveURL: URL = {
    let documentsDirectories = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
    let documentDirectory = documentsDirectories.first!
    return documentDirectory.appendingPathComponent("beers.archive")
    }()
    
    
    init() {
        do {
            let data = try Data(contentsOf: beerArchiveURL)
            if let archivedData = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? [Beer] {
                    allBeers = archivedData
                }
        } catch {
            allBeers = []
        }
    }
    func saveChanges() -> Bool {
        print("Saving items to: \(beerArchiveURL.path)")
        do {
            let data = try NSKeyedArchiver.archivedData(withRootObject: allBeers, requiringSecureCoding: false)
            try data.write(to: beerArchiveURL)
            return true
        } catch {
            return false
        }
    }

@discardableResult func createBeer() -> Beer {
       let newBeer = Beer(random: true)
  //  let newBeer = Beer(name: "", brewery: "", valueInDollars: 0, address: "")
        allBeers.append(newBeer)
        return newBeer
    }
    
    func removeBeer(_ beer: Beer) {
        if let index = allBeers.firstIndex(of: beer) {
            allBeers.remove(at: index) }
    }
    
    func moveBeer(from fromIndex: Int, to toIndex: Int) {
        if fromIndex == toIndex {
            return
        }
        let movedBeer = allBeers[fromIndex]
        allBeers.remove(at: fromIndex)
        allBeers.insert(movedBeer, at: toIndex)
        
    }

}
