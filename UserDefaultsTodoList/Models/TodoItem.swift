//
//  TodoItem.swift
//  UserDefaultsTodoList
//
//  Created by Gustavo Carvalho on 06/04/22.
//

import Foundation

class TodoItem : Codable {
    var title: String!
    var completed: Bool!
    
    internal init(_ title: String) {
        self.title = title
        self.completed = false
    }
    
}
