//
//  ViewController.swift
//  Todoey
//
//  Created by MBP 2014 Technopartner on 02/04/18.
//  Copyright © 2018 MBP 2014 Technopartner. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {

    let arrayItem = ["Find Mako", "Ride Jaeger", "Kill Kaiju","sasasasa"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    //MARK - TableView Datasource Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayItem.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        cell.textLabel?.text = arrayItem[indexPath.row]
        return cell
    }

    //MARK - Tableviwe Delegate methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        if(tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark){
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        }
        else{
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        tableView.deselectRow(at: indexPath, animated: true)
        
    }

}

