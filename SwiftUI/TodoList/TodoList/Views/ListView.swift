//
//  ListView.swift
//  TodoList
//
//  Created by Sophia Lu on 6/28/21.
//

import SwiftUI

struct ListView: View {
    @EnvironmentObject var listVM: ListViewModel
    
    var body: some View {
        List {
            ForEach(listVM.items) { item in
                ListRowView(item: item)
                    .onTapGesture {
                        listVM.changeItem(item)
                    }
            }
            .onDelete(perform: listVM.deleteItem)
            .onMove(perform: listVM.moveItem)
        }
        .navigationTitle("My Todo List 📝")
        .navigationBarItems(leading: EditButton(),
                            trailing: NavigationLink("Add", destination: AddTodoView().environmentObject(listVM)))
    }
    

}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ListView()
        }
    }
}
