//
//  ViewController.swift
//  Todoey
//
//  Created by Juan Silva on 20/02/2019.
//  Copyright © 2019 Juan Silva. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {

    var itemArray = ["Lisboa","London","Brazil"]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        cell.textLabel?.text = itemArray[indexPath.row]
        return cell
    }
    
    //MARK - TableView Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print(itemArray[indexPath.row])

        //Setting up Accessorie(check mark)
        
        
        if(tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark){
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        
        
        //Deselecting row in order to lose the gray background
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    //MARK - Add New Items
    @IBAction func addButtomPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        //The alert
        let alert = UIAlertController.init(title: "Add New Todoey Item", message: "", preferredStyle: .alert)
        //The action / What will happen once the user clicks the Add Item button on the alert
        let action = UIAlertAction.init(title: "Add Item", style: .default) { (action) in
            //Adding new item to the list
            self.itemArray.append(textField.text!)
            // Reloading the data so tha the new item can be showed on the list
            self.tableView.reloadData()
        }
        //Adding action to the alert
        alert.addAction(action)
        //Adding Text Field
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new item"
            textField = alertTextField
            
        }
        //Presenting the alert
        present(alert, animated: true, completion: nil)
        
    }
    
    


}

