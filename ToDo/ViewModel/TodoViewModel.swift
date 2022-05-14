//
//  TodoViewModel.swift
//  ToDo
//
//  Created by Gurjit Singh on 14/5/2022.
//

import Foundation

class ToDoViewModel : ObservableObject{
    let todoKey: String = "todoKey"
    @Published var listItems: [TodoModel] = []{
        didSet{
            saveTodo()
        }
    }
    
    init(){
        getItem()
    }
    
    func getItem(){
       
        guard
            let todoData = UserDefaults.standard.data(forKey: todoKey),
            let savedTodo = try? JSONDecoder().decode([TodoModel].self, from: todoData)
        else { return }
        
        self.listItems = savedTodo
    }
    
    func deleteTodo(indexSet: IndexSet){
        listItems.remove(atOffsets: indexSet)
    }
    
    func moveItem(from :IndexSet, to: Int){
        listItems.move(fromOffsets: from, toOffset: to)
    }
    
    func addTodo(title:String){
        let newTodo = TodoModel(title: title, completed: false)
        listItems.append(newTodo)
    }
    
    func updateTodoStatus(item: TodoModel){
        if let index = listItems.firstIndex(where: { $0.id == item.id}){
            listItems[index] = item.updateCompleted()
        }
    }
    
    func saveTodo(){
        if let encodedData = try? JSONEncoder().encode(listItems){
            UserDefaults.standard.set(encodedData, forKey: todoKey)
        }
    }
}
