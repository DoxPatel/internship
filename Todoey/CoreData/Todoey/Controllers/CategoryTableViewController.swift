//
//  CategoryTableViewController.swift
//  Todoey
//
//  Created by Jaydip Goti on 09/02/23.
//  Copyright © 2023 App Brewery. All rights reserved.
//

import UIKit
import CoreData

class CategoryTableViewController: UITableViewController {

    var categories = [Categorys]()
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    override func viewDidLoad() {
        super.viewDidLoad()
        loadCategories()
        

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "categoryCell", for: indexPath)
        cell.textLabel?.text = categories[indexPath.row].name
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "GotoItem", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinattionVC = segue.destination as! TodoListTableViewController
        if let indexPath = tableView.indexPathForSelectedRow{
            destinattionVC.selectedCategory = categories[indexPath.row]
        }
        
    }
    
    
    
    
    
    
    
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        let alert = UIAlertController(title: "Add New Category", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "add", style: .default) { (action) in
            
            let newCategory = Categorys(context: self.context)
            newCategory.name = textField.text!
            self.categories.append(newCategory)
            self.saveCategories()
        }
        
        alert.addAction(action)
        alert.addTextField { (field) in
            textField = field
            textField.placeholder = "Add a new category"
        }
        present(alert, animated: true, completion: nil)
        
    }
    
    func saveCategories(){
        do{
            try context.save()
        }catch{
            print("Error save data from context,\(error)")
        }
        tableView.reloadData()
    }
    func loadCategories(with request:NSFetchRequest<Categorys> = Categorys.fetchRequest()){
        do{
            categories = try context.fetch(request)
        }catch{
            print("Error fetching data from context,\(error)")
        }
        self.tableView.reloadData()
    }
    

}
