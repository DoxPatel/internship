//
//  CategoryTableViewController.swift
//  Todoey
//
//  Created by Jaydip Goti on 09/02/23.
//  Copyright © 2023 App Brewery. All rights reserved.
//

import UIKit
import RealmSwift
import SwipeCellKit
import ChameleonFramework

class CategoryTableViewController: SwipeTableViewController {
    
    
	    let realm = try! Realm()
    
    var categories : Results<Category>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadCategories()
        
        
        
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories?.count ?? 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = super.tableView(tableView, cellForRowAt: indexPath)
        cell.textLabel?.text = categories?[indexPath.row].name ?? "Category not add"
        cell.backgroundColor = UIColor(hexString: categories?[indexPath.row].coloe ?? "")
//        print(UIColor.randomFlat().hexValue())
        return cell 
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "GotoItem", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinattionVC = segue.destination as! TodoListTableViewController
        if let indexPath = tableView.indexPathForSelectedRow{
            destinattionVC.selectedCategory = categories?[indexPath.row]
           
        }
        
    }
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        let alert = UIAlertController(title: "Add New Category", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "add", style: .default) { (action) in
            
            let newCategory = Category()
            newCategory.name = textField.text!
            newCategory.coloe = UIColor.randomFlat().hexValue()
            self.save(category:newCategory)
        }
        
        alert.addAction(action)
        alert.addTextField { (field) in
            textField = field
            textField.placeholder = "Add a new category"
        }
        present(alert, animated: true, completion: nil)
        
    }
    
    func save(category: Category){
        do{
            try realm.write({
                realm.add(category)
                
            })
        }catch{
            print("Error saving Categories \(error)")
        }
        tableView.reloadData()
    }
    func loadCategories(){
        categories = realm.objects(Category.self)
        
    }
    
    override func updateModel(at indexPath: IndexPath) {
        let item = self.categories![indexPath.row]
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
