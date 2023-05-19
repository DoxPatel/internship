//
//  TodoListTableViewController.swift
//  Todoey
//
//  Created by Jaydip Goti on 06/02/23.
//  Copyright © 2023 App Brewery. All rights reserved.
//

import UIKit
import RealmSwift
import SwipeCellKit
import ChameleonFramework

class TodoListTableViewController: SwipeTableViewController {
    
    let realm = try! Realm()
    var todoItems : Results<Item>?
   
    
    var selectedCategory : Category!{
        didSet{
            loadItems()
        }
    }
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask))
//        tableView.separatorStyle = .none
               
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let colourHex = selectedCategory?.coloe{
            title = selectedCategory!.name
            guard let navBar = self.navigationController?.navigationBar else {fatalError("Navigation controller does not exist")}
            if let navBarColour = UIColor(hexString: colourHex) {
                //Original setting: navBar.barTintColor = UIColor(hexString: colourHex)
                //Revised for iOS13 w/ Prefer Large Titles setting:
                navBar.backgroundColor = navBarColour
                navBar.tintColor = ContrastColorOf(navBarColour, returnFlat: true)
                searchBar.barTintColor = navBarColour
            }
        }
        
     
    }
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoItems?.count ?? 1
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = super.tableView(tableView, cellForRowAt: indexPath)
        if let item = todoItems?[indexPath.row]{
            cell.textLabel?.text = item.title
            cell.accessoryType = item.done == true ? .checkmark : .none
            if let colore = UIColor(hexString: selectedCategory.coloe)!.darken(byPercentage: CGFloat(Float(indexPath.row) / Float(todoItems!.count))){
                cell.backgroundColor = colore
                cell.textLabel?.textColor = ContrastColorOf(colore, returnFlat: true)
            }
            
        }else{
            cell.textLabel?.text = "Not Items Add"
        }
 
        
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let item = todoItems?[indexPath.row]{
            do{
                try realm.write{
                item.done = !item.done
//                    realm.delete(item)
                }
            }
            catch{
                print("Error saving done status, \(error)")
            }
        }
        tableView.reloadData()
        tableView.deselectRow(at: indexPath, animated: true )
    }
    
    @IBAction func addButoonPressed(_ sender: UIBarButtonItem) {
        
        
        var testfiled = UITextField()
        let alert = UIAlertController(title: "Add New Todoey Item", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add Item", style: .default) { [self] action in
            
            if let currentCategory = self.selectedCategory{
                do{
                    try realm.write {
                        let newitem = Item()
                        newitem.title = testfiled.text!
                        newitem.dateCreated = Date()
                        newitem.coloe = UIColor.randomFlat().hexValue()
                        currentCategory.items.append(newitem)
                    }
                }catch{
                    print("Error saving Categories \(error)")
                }
            }
            
            tableView.reloadData()
        }
        
        alert.addTextField { alerttextfiled in
            alerttextfiled.placeholder = "Create new item"
            testfiled = alerttextfiled
            
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    
    func loadItems(){
        todoItems = selectedCategory.items.sorted(byKeyPath: "title", ascending: true)
        self.tableView.reloadData()
    }
    override func updateModel(at indexPath: IndexPath) {
       
       let item = self.todoItems![indexPath.row]
           do{
               try self.realm.write{
                   self.realm.delete(item)
               }
           }
           catch{
               print("Error saving done status, \(error)")
           }
   }
    
    
    
    
}

extension TodoListTableViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        todoItems = todoItems?.filter("title CONTAINS[cd] %@", searchBar.text!).sorted(byKeyPath: "dateCreated", ascending: true)
        tableView.reloadData()
    }

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text?.count == 0{
            loadItems()
            DispatchQueue.main.async {
                searchBar.resignFirstResponder()
            }

        }
    }
}
