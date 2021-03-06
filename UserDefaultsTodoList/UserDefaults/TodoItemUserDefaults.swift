//
//  TodoItemUserDefaults.swift
//  UserDefaultsTodoList
//
//  Created by Gustavo Carvalho on 06/04/22.
//

import Foundation

class TodoItemUserDefaults {
    
    private let todosKey = "@todos"
    
    func save(item: TodoItem) {
        do {
            
            var todos = self.getAll()
            todos.insert(item, at: 0)
            
            try encodeAndSave(todos)
        } catch {
            print("Error occurs saving todo")
        }
    }
    
    func getAll() -> [TodoItem] {
        do {
            // Try to get all created todos
            if let savedTodos = UserDefaults.standard.data(forKey: todosKey) {
                
                // Decode all JSON todos to array
                let decoder = JSONDecoder()
                let decodedTodos = try decoder.decode([TodoItem].self, from: savedTodos)
                
                return decodedTodos
            } else {
                return []
            }
        } catch {
            print("Error occurs retrieving todo")
        }
        
        return [];
    }
    
    func delete(index: Int) {
        do {
            
            var todos = self.getAll()
            todos.remove(at: index)
            
            try encodeAndSave(todos)
        } catch {
            print("Error occurs deleting todo")
        }
    }
    
    func updateTodo(index: Int, item: TodoItem) {
        do {
            
            var todos = self.getAll()
            todos[index] = item
            
            try encodeAndSave(todos)
        } catch {
            print("Error occurs updating todo")
        }
    }
    
    private func encodeAndSave (_ todos: [TodoItem]) throws {
        // Encodes array to JSON
        let encoder = JSONEncoder()
        let encodedTodos = try encoder.encode(todos)
        
        // Save todos on current state and on user defaults
        UserDefaults.standard.set(encodedTodos, forKey: todosKey)
    }
    
}
