//
//  MainTableViewController.swift
//  assesment2
//
//  Created by Ben Brandau Brandau on 7/31/20.
//  Copyright © 2020 Ben Brandau. All rights reserved.
//

import UIKit

class MainTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

  
    }
// Actions
    
    @IBAction func addButtonTapped(_
        sender: Any) {
      //  presentAlertController()
    }
    
// MARK: - Table view data source



    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return ShoppingListController.shared.fetchedResultsController.object?(at: .IndexPath).count ?? 0
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "shoppingCell", for: indexPath)
        let statusToDisplay = ShoppingListController.shared.fetchedResultsController

        // Configure the cell...

        return cell
    }
    
// Helpers
    
    func presentAlertController(){
        let alertController = UIAlertController(title: "what do you need to buy today?", message: nil, preferredStyle: .alert)
        alertController.addTextField { (textField) in
            textField.placeholder = " Enter Item..."
        }
        let cancelAction = UIAlertAction(title: "cancel", style: .cancel, handler: nil)
        let addItemAction = UIAlertAction(title: "add", style: .default) { (_) in
            guard let itemName = alertController.textFields?[0].text, !itemName.isEmpty,
        
                ShoppingListController.shared.createItem(itemName: itemName, isBought: false)
        }
        alertController.addAction(cancelAction)
        alertController.addAction(addItemAction)
        present(alertController,animated: true)
    }
    


}// End of  MainTableView
