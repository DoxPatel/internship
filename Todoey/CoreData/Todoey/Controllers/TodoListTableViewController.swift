//
//  TodoListTableViewController.swift
//  Todoey
//
//  Created by Jaydip Goti on 06/02/23.
//  Copyright © 2023 App Brewery. All rights reserved.
//

import UIKit
import CoreData

class TodoListTableViewController: UITableViewController {
    
    
    var itemArray = [Item]()
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var selectedCategory : Categorys?{
        didSet{
            loadItems()
        } 
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask))
               
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let call = tableView.dequeueReusableCell(withIdentifier: "Todolist", for: indexPath)
        call.textLabel?.text = itemArray[indexPath.row].titel
        call.accessoryType = itemArray[indexPath.row].done == true ? .checkmark : .none
        
        return call
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //        context.delete(itemArray[indexPath.row])
        //        itemArray.remove(at: indexPath.row)
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
        self.saveItems()
        tableView.deselectRow(at: indexPath, animated: true )
    }
    
    @IBAction func addButoonPressed(_ sender: UIBarButtonItem) {
        
        
        var testfiled = UITextField()
        let alert = UIAlertController(title: "Add New Todoey Item", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add Item", style: .default) { action in
            
            let newitem = Item(context: self.context)
            newitem.titel = testfiled.text!
            newitem.done = false
            newitem.parentCataegory = self.selectedCategory
            print(newitem.parentCataegory as Any)
            self.itemArray.append(newitem)
            self.saveItems()
            
        }
        
        alert.addTextField { alerttextfiled in
            alerttextfiled.placeholder = "Create new item"
            testfiled = alerttextfiled
            
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    
    func saveItems(){
        do{
            try context.save()
        }
        catch{
            print("Error saving context \(error)")
        }
        self.tableView.reloadData()
    }
    
    func loadItems(with request:NSFetchRequest<Item> = Item.fetchRequest(), predicate: NSPredicate? = nil){
        let catagoryPredicate = NSPredicate(format: "parentCataegory.name MATCHES %@", selectedCategory!.name!)
        
        if let addtionlPredicate = predicate{
            request.predicate = NSCompoundPredicate(andPredicateWithSubpredicates: [catagoryPredicate, addtionlPredicate])
        }else{
            request.predicate = catagoryPredicate
        }
        
        do{
            itemArray = try context.fetch(request)
        }catch{
            print("Error fetching data from context,\(error)")
        }
        self.tableView.reloadData()
    }
    
    
}

extension TodoListTableViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        let request:NSFetchRequest<Item> = Item.fetchRequest()
       let predicate = NSPredicate(format: "titel CONTAINS[cd] %@", searchBar.text!)
        request.sortDescriptors = [NSSortDescriptor(key: "titel", ascending: true)]
        loadItems(with: request,predicate: predicate)
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
