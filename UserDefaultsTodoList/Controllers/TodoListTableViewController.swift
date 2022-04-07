//
//  ViewController.swift
//  UserDefaultsTodoList
//
//  Created by Gustavo Carvalho on 06/04/22.
//

import UIKit

class TodoListTableViewController: UITableViewController {

    let todosUserDefaults = TodoItemUserDefaults()
    var todos: [TodoItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.reloadData()
    }
    
    private func reloadData () {
        todos = todosUserDefaults.getAll()
        tableView.reloadData()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todosUserDefaults.getAll().count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "todoCell", for: indexPath) as! TodoItemTableViewCell
        
        let todo = todos[indexPath.row];
        
        let cellText = NSAttributedString(
            string: todo.title,
            attributes: todo.completed
                ? [.strikethroughStyle: NSUnderlineStyle.single.rawValue]
                : [.strikethroughStyle: NSUnderlineStyle.thick]
        )
        
        cell.titleLabel.attributedText = cellText
        cell.statusSwitch.tag = indexPath.row
        cell.statusSwitch.isOn = todo.completed
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            todosUserDefaults.delete(index: indexPath.row)
            todos = todosUserDefaults.getAll()
            
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
        
    }
    
    @IBAction func onChangeTodoState(_ sender: UISwitch) {
        // Get working todo index
        let todoIndex = sender.tag;
        
        // Toggle todo completed
        let todo = todos[todoIndex]
        todo.completed = !todo.completed
        todosUserDefaults.updateTodo(index: todoIndex, item: todo)
        
        // Reload todo row
        todos = todosUserDefaults.getAll()
        tableView.reloadRows(at: [IndexPath(row: todoIndex, section: 0)], with: .automatic)
    }
}

