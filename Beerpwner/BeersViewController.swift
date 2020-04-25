//
//  BeersViewController.swift
//  Beerpwner
//
//  Created by Kwasi Efah on 3/28/20.
//  Copyright © 2020 KE. All rights reserved.
//

import UIKit

class BeersViewController: UITableViewController {
    var beerStore: BeerStore!
    @IBAction func addNewItem(_ sender: UIBarButtonItem) {
        let newItem = beerStore.createBeer()
        if let index = beerStore.allBeers.firstIndex(of: newItem) {
            let indexPath = IndexPath(row: index, section: 0)
            tableView.insertRows(at: [indexPath], with: .automatic)
        }
    }
       
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder:aDecoder)
        navigationItem.leftBarButtonItem = editButtonItem
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return beerStore.allBeers.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        let beer = beerStore.allBeers[indexPath.row]
        cell.textLabel?.text = beer.name
        cell.detailTextLabel?.text = "$\(beer.valueInDollars)"
        if beer.valueInDollars > 25 {
            cell.detailTextLabel?.textColor = .red
        } else if beer.valueInDollars > 15 {
            cell.detailTextLabel?.textColor = .orange
        } else {
            cell.detailTextLabel?.textColor = UIColor(red: 0, green: 0.8, blue: 0, alpha: 0.8)
        }
        return cell
    }
    

    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let beer = beerStore.allBeers[indexPath.row]
            let title = "Delete \(beer.name)?"
            let message = "Are you sure you want to delete this item?"
            let ac = UIAlertController(title: title, message: message,
            preferredStyle: .actionSheet)
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            ac.addAction(cancelAction)
            let deleteAction = UIAlertAction(title: "Delete", style: .destructive, handler: { (action) -> Void in
                self.beerStore.removeBeer(beer)
                self.tableView.deleteRows(at: [indexPath], with: .fade)
                })
            ac.addAction(deleteAction)
            present(ac, animated: true, completion: nil)
        } 
    }
    

    
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        beerStore.moveBeer(from: sourceIndexPath.row, to: destinationIndexPath.row)
    }
    

    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "showBeer"?:
        if let row = tableView.indexPathForSelectedRow?.row {
        let beer = beerStore.allBeers[row]
        let detailViewController = segue.destination as! DetailViewController
        detailViewController.beer = beer
        } default:
        preconditionFailure("Unexpected segue identifier.") }
    }
    

}
