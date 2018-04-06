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
    let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("Items.plist")

    override func viewDidLoad() {
        super.viewDidLoad()
        

        loadItems()
        
//        if let items = defaults.array(forKey: "TodoListArray") as? [Item]{
//            arrayItem = items
//        }
        
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
        saveItems()
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
//            self.defaults.set(self.arrayItem, forKey: "TodoListArray")
            self.saveItems()
        }
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create New Item"
            textField = alertTextField
        }
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    // MARK - Model Manipulation methods
    
    func saveItems(){
        let encoder = PropertyListEncoder()
        
        do{
            let data = try encoder.encode(arrayItem)
            try data.write(to: dataFilePath!)
        } catch{
            print("\(error)")
        }
        
        self.tableView.reloadData()
    }
    
    func loadItems(){
        if let data = try? Data(contentsOf: dataFilePath!){
            let decoder = PropertyListDecoder()
            do{
                arrayItem = try decoder.decode([Item].self, from: data)
            } catch{
                print("\(error)")
            }
        }
    }
    
}

