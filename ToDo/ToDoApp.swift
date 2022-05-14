//
//  ToDoApp.swift
//  ToDo
//
//  Created by Gurjit Singh on 14/5/2022.
//

import SwiftUI

@main
struct ToDoApp: App {
    
    @StateObject var todoViewModel : ToDoViewModel = ToDoViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView{
                ListView()
            }.environmentObject(todoViewModel)
        }
    }
}
