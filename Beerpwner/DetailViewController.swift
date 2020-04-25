//
//  DetailViewController.swift
//  Beerpwner
//
//  Created by Kwasi Efah on 3/28/20.
//  Copyright © 2020 KE. All rights reserved.
//

import UIKit

class DetailViewController : UIViewController, UITextFieldDelegate {
    
    @IBOutlet var nameField: UITextField!
    @IBOutlet var priceField: UITextField!
    @IBOutlet var breweryField: UITextField!
    @IBOutlet var addressField: UITextField!
    @IBOutlet var dateLabel: UILabel!
    
    @IBAction func backgroundTapped(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    @IBAction func trashCan(_ sender: UIBarButtonItem) {
        if let navController = self.navigationController, navController.viewControllers.count >= 2 {
        let beersViewController = navController.viewControllers[navController.viewControllers.count - 2] as! BeersViewController
        let title = "Delete \(beer.name)?"
        let message = "Are you sure you want to delete this item?"
        let ac = UIAlertController(title: title, message: message,
        preferredStyle: .actionSheet)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        ac.addAction(cancelAction)
        let deleteAction = UIAlertAction(title: "Delete", style: .destructive, handler: { (action) -> Void in
            beersViewController.beerStore.removeBeer(self.beer)
            self.navigationController?.popToViewController(beersViewController, animated: true)
            })
        ac.addAction(deleteAction)
        present(ac, animated: true, completion: nil)
            
    }
}
    
    var beer: Beer! {
        didSet {
            navigationItem.title = beer.name
        }
    }
    
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
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        view.endEditing(true)

        beer.name = nameField.text ?? ""
        beer.address = addressField.text ?? ""
        beer.brewery = breweryField.text ?? ""
        if let priceText = priceField.text, let value = numberFormatter.number(from: priceText) { beer.valueInDollars = value.intValue
        } else {
        beer.valueInDollars = 0
            
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool { textField.resignFirstResponder()
    return true }
    
}
