//
//  DetailViewController.swift
//  Beerpwner
//
//  Created by Kwasi Efah on 3/28/20.
//  Copyright © 2020 KE. All rights reserved.
//

import UIKit

class DetailViewController : UIViewController {
    
    @IBOutlet var nameField: UITextField!
    @IBOutlet var priceField: UITextField!
    @IBOutlet var breweryField: UITextField!
    @IBOutlet var addressField: UITextField!
    @IBOutlet var dateLabel: UILabel!
    
    var beer: Beer!
    
    let numberFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter
    }()
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        return formatter
    }()
    
    override func viewWillAppear(_ animated: Bool) { super.viewWillAppear(animated)
        nameField.text = beer.name
        breweryField.text = beer.brewery
        addressField.text = beer.address
        priceField.text = numberFormatter.string(from: NSNumber(value: beer.valueInDollars))
        dateLabel.text = dateFormatter.string(from: beer.dateCreated)
    }
    
}
