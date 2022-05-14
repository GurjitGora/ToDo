//
//  ListView.swift
//  ToDo
//
//  Created by Gurjit Singh on 14/5/2022.
//

import SwiftUI

struct ListView: View {
    @EnvironmentObject var todoViewModelObject : ToDoViewModel
    
    var body: some View {
        List{
            ForEach(todoViewModelObject.listItems) { item in
                    
                TodoListView(item: item).onTapGesture {
                    withAnimation(.linear){
                        todoViewModelObject.updateTodoStatus(item: item)
                    }
                }
            }.onDelete(perform:  todoViewModelObject.deleteTodo)
                .onMove (perform: todoViewModelObject.moveItem)
                
        }
        .listStyle(PlainListStyle())
        .navigationTitle("Todo's ✔").navigationBarItems(leading: EditButton(), trailing: NavigationLink.init("add", destination: AddToDO()))
    }
  
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            ListView()
        }.environmentObject(ToDoViewModel())
    }
}

