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
    init() {
        createBeer()
    for _ in 0..<3 {
            createBeer()
        }
    }


@discardableResult func createBeer() -> Beer {
    let newBeer = Beer(random: true)
    allBeers.append(newBeer)
    return newBeer
    }
}
