//
//  ViewController.swift
//  Todoey
//
//  Created by Juan Silva on 20/02/2019.
//  Copyright © 2019 Juan Silva. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {

    var itemArray = [Item]()
    //An interface to the user's defaults database, store key-value pairs persistently across launches of the app
    let defaults = UserDefaults.standard
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let newItem1 = Item()
        newItem1.title = "Lisboa"
        itemArray.append(newItem1)
        
        let newItem2 = Item()
        newItem2.title = "Brasilia"
        itemArray.append(newItem2)
        
        let newItem3 = Item()
        newItem3.title = "Londres"
        itemArray.append(newItem3)
        // Retriving data from UsersDefault
        if let items = defaults.array(forKey: "TodoListArray") as? [Item]{
            itemArray = items
        }
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        let item = itemArray[indexPath.row]
        
        cell.textLabel?.text = item.title
        
        //Ternary operator ==>
        // value = condition ? valueIfTrue : valueIfFalse
        cell.accessoryType = item.done ? .checkmark : .none
        
        /*if item.done == true {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }*/
        return cell
    }
    
    //MARK - TableView Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //Setting up Accessorie(check mark)
        
        //True to false, false to true(riversing )
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
        tableView.reloadData()
        
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
            let newItem = Item()
            newItem.title = textField.text!
            
            //Adding new item to the list
            self.itemArray.append(newItem)
            //saving itemArray into UserDefault
            self.defaults.set(self.itemArray, forKey: "TodoListArray")
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

