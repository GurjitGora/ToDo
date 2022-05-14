//
//  TodoModel.swift
//  ToDo
//
//  Created by Gurjit Singh on 14/5/2022.
//

import Foundation

struct TodoModel: Identifiable, Codable{
    let id: String
    let title: String
    let completed: Bool
    
    init(id: String = UUID().uuidString, title: String, completed: Bool){
        self.id = id
        self.title = title
        self.completed = completed
    }
    
    func updateCompleted () -> TodoModel {
        return TodoModel(id: id, title: title, completed: !completed)
    }
}
