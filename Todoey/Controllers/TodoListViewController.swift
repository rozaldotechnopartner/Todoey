//
//  ViewController.swift
//  Todoey
//
//  Created by MBP 2014 Technopartner on 02/04/18.
//  Copyright © 2018 MBP 2014 Technopartner. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {

    var arrayItem = [Item]()
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let newItem = Item()
        newItem.title = "Find Mako"
        arrayItem.append(newItem)
        
        let newItem2 = Item()
        newItem2.title = "Find Mako"
        arrayItem.append(newItem2)

        let newItem3 = Item()
        newItem3.title = "Find Mako"
        arrayItem.append(newItem3)
        
        if let items = defaults.array(forKey: "TodoListArray") as? [Item]{
            arrayItem = items
        }
        
    }
    //MARK - TableView Datasource Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayItem.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        let item = arrayItem[indexPath.row]
        cell.textLabel?.text = item.title
        
        cell.accessoryType = item.done == true ? .checkmark : .none
        
        return cell
    }

    //MARK - Tableviwe Delegate methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        arrayItem[indexPath.row].done = !arrayItem[indexPath.row].done
        
        tableView.reloadData()
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    //MARK - Add New Item
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        let alert = UIAlertController(title: "Add New Todoey Item", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add Item", style: UIAlertActionStyle.default) { (action) in
            //what will happen if the user click the button
//            print(textField.text)
            let newItem = Item()
            newItem.title = textField.text!
            self.arrayItem.append(newItem)
//            self.arrayItem.append(textField.text!)
            self.defaults.set(self.arrayItem, forKey: "TodoListArray")
            self.tableView.reloadData()
        }
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create New Item"
            textField = alertTextField
        }
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
}

