//
//  TodoListView.swift
//  ToDo
//
//  Created by Gurjit Singh on 14/5/2022.
//

import SwiftUI


struct TodoListView: View {
    
    let item: TodoModel
    
    
    var body: some View {
        HStack{
            Image(systemName: item.completed ? "checkmark.circle": "circle")
                .foregroundColor(item.completed ? .green : .red)
            Text(item.title).font(.title2).padding(.vertical,8)
            Spacer()
        }
    }
}

struct TodoListView_Previews: PreviewProvider {
    static var item1 = TodoModel(title:"buy bridge", completed: true)
    static var item2 = TodoModel(title:"buy ship", completed: false)
    static var previews: some View {
        Group{
            TodoListView(item: item1)
            TodoListView(item: item2)
        }.previewLayout(.sizeThatFits)
    }
}
