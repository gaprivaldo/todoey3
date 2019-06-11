//
//  ViewController.swift
//  todoey3
//
//  Created by Rivaldo Ieong on 2019/6/10.
//  Copyright © 2019 Rivaldo Ieong. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {
    
    var itemArray=[Item]()
    
    let defaults = UserDefaults.standard


    override func viewDidLoad() {
        super.viewDidLoad()
        
        let newItem=Item()    //delete it after default
        newItem.title="Find Mike"
        itemArray.append(newItem)

        let newItem2=Item()
        newItem2.title="Buy eggs"
        itemArray.append(newItem2)
        
        let newItem3=Item()
        newItem3.title="Buy"
        itemArray.append(newItem3)
        
        
        if let items = defaults.array(forKey: "TodoListArray") as? [Item] {
            itemArray = items   //itemArray = defaults.array(forKey: "TodoListArray") as? [String]
        }
        
    }

//MARK: - Tableview Datasource Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell",for: indexPath)

        let item = itemArray[indexPath.row]
        
        cell.textLabel?.text = item.title
        
        
        //Ternary operator ==>
        // value = condition ? valueIfTrue : valueIfFalse
        
        cell.accessoryType = item.done ? .checkmark : .none //cell.accessoryType = item.done == true ? .checkmark : .none

        return cell
    }
    
    //MARK: - TableView Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done  //if it is true, it will turn to be false

        tableView.reloadData()
        
        

        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    
    
    
    
    
    //MARK - Add New Items
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()   //initiatlize a new textField
        
        let alert = UIAlertController(title: "Add New Todoey Item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            //what will happen once the user clicks the Add Item button on our UIAlert
            
            

            let newItem=Item()
            newItem.title=textField.text!
            
            self.itemArray.append(newItem)  //append the new data from alert to list
            
            self.defaults.set(self.itemArray, forKey: "TodoListArray")
            
            self.tableView.reloadData()
        }
        
        
        
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new item"  //placeholder means the text you can see will be remove after edit
            textField = alertTextField  // save as var textField = UITextField()

        }

        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
   
}

