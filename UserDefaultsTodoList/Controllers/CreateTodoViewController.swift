//
//  CreateTodoViewController.swift
//  UserDefaultsTodoList
//
//  Created by Gustavo Carvalho on 06/04/22.
//

import UIKit

class CreateTodoViewController: UIViewController {

    @IBOutlet weak var todoTitleField: UITextField!
    @IBOutlet weak var addTodoButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        handleValidateTodoData()
    }
    
    @IBAction func onAddTodo(_ sender: UIButton) {
        // Create the new todo instance and save on user defaults
        let newTodo = TodoItem(todoTitleField.text!)
        
        let todoUserDefaults = TodoItemUserDefaults()
        todoUserDefaults.save(item: newTodo)
        
        // Clear title field
        todoTitleField.text = ""
        handleValidateTodoData()
        
        // Back to todos screen
        navigationController?.popViewController(animated: true)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }

    
    @IBAction func onChangeTodoTitle(_ sender: UITextField) {
        handleValidateTodoData()
    }
    
    func handleValidateTodoData () {
        // Enable or disable submit button depending if todo title is set or not
        if todoTitleField.text!.isEmpty || todoTitleField.text == nil {
            addTodoButton.isEnabled = false
        } else {
            addTodoButton.isEnabled = true
        }
    }

}
