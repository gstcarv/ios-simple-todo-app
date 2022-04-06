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
            todos.append(item)
            
            // Encodes array to JSON
            let encoder = JSONEncoder()
            let encodedTodos = try encoder.encode(todos)
            
            // Save todos on current state and on user defaults
            UserDefaults.standard.set(encodedTodos, forKey: todosKey)
        } catch {
            print("Error occurs saving todo")
        }
    }
    
    func getAll() -> [TodoItem] {
        do {
            // Try to get all created todos
            if let savedTodos = UserDefaults.standard.data(forKey: todosKey) {
                
                // Decode all JSON todos to array
                let decoder = JSONDecoder();
                let decodedTodos = try decoder.decode([TodoItem].self, from: savedTodos)
                
                return decodedTodos;
            } else {
                return []
            }
        } catch {
            print("Error occurs retrieving todo")
        }
        
        return [];
    }
    
}
