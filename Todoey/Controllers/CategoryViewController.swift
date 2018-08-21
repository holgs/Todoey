//
//  CategoryViewController.swift
//  Todoey
//
//  Created by Holger Ferrero on 20/08/2018.
//  Copyright © 2018 Holger Ferrero. All rights reserved.
//

import UIKit
import CoreData

class CategoryViewController: UITableViewController {

    var categoryArray = [Category]()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loadCategory()
    }
    
    //MARK: -- TableView datasource methods
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let categoryCell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath)
        
        categoryCell.textLabel?.text = categoryArray[indexPath.row].name
        
        return categoryCell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoryArray.count
    }
    
    //MARK: -- TableView delegate methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "goToItems", sender: self)
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! ToDoListViewController
        
        if let indexPath = tableView.indexPathForSelectedRow {
            destinationVC.selectedCategory = categoryArray[indexPath.row]
        }
        
        
        
    }
    
    
    //MARK: -- Data manipulation methods
    func saveCategory() {
        do {
            try context.save()
        } catch {
            print("Error saving category \(error)")
        }
        self.tableView.reloadData()
    }
    
    func loadCategory(with request: NSFetchRequest<Category> = Category.fetchRequest()) {
        do {
            categoryArray = try context.fetch(request)
        } catch {
            print("Error loading category \(error)")
        }
        tableView.reloadData()
    }
    
    //MARK: -- Add new Category

    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var categoryTextField = UITextField()
        
        let alert = UIAlertController(title: "Add new category", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Category", style: .default) {
             (action) in
            let newCategory = Category(context: self.context)
            newCategory.name = categoryTextField.text
            
            self.categoryArray.append(newCategory)
            
            self.saveCategory()
        }
        
        alert.addTextField {
            (alertTextField) in
            alertTextField.placeholder = "Create new Category"
            categoryTextField = alertTextField
        }
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
    }

}
