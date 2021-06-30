//
//  TodoListApp.swift
//  TodoList
//
//  Created by Sophia Lu on 6/28/21.
//

import SwiftUI

@main
struct TodoListApp: App {
    
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        
        WindowGroup {
            NavigationView {
                ListView().environmentObject(listViewModel)
            }
                
        }
    }
}
