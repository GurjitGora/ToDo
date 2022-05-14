//
//  AddToDO.swift
//  ToDo
//
//  Created by Gurjit Singh on 14/5/2022.
//

import SwiftUI

struct AddToDO: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @EnvironmentObject var todoViewModelObject : ToDoViewModel
    
    @State var newTodoText: String = ""
    @State var alertTitle: String = ""
    @State var showAlert : Bool = false
    
    var body: some View {
        ScrollView{
            VStack {
                TextField("Add new todo", text: $newTodoText)
                    .padding(.horizontal)
                    .frame(height:50)
                    .background(.gray.opacity(0.2))
                    .cornerRadius(10)
                
                Button(action: saveTodo, label: {
                    Text("Add".uppercased())
                        .foregroundStyle(.white).font(.headline)
                        .frame( height: 50).frame(maxWidth:.infinity)
                        .background(Color.accentColor)
                })

            }.padding(10)
        }.navigationTitle("Add an items")
            .alert(isPresented: $showAlert, content: presentAlert )
    }
    
    func saveTodo(){
        if textAppropriate() {
            self.todoViewModelObject.addTodo(title: newTodoText)
            presentationMode.wrappedValue.dismiss()
        }
        
    }
    
    func textAppropriate() -> Bool{
        if(newTodoText.count < 3 ){
            alertTitle = "Todo should be more than 3 characters long....."
            showAlert.toggle()
            return false
        }
        return true
    }
    
    func presentAlert()-> Alert{
        
            return Alert(title: Text(alertTitle))
        
    }
    
}

struct AddToDO_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddToDO(newTodoText: "")
        }.environmentObject(ToDoViewModel())
    }
}
