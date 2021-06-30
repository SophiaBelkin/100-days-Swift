//
//  ListViewModel.swift
//  TodoList
//
//  Created by Sophia Lu on 6/28/21.
//

import Foundation

class ListViewModel:ObservableObject {
    @Published var items: [Item] = [] {
        didSet {
            saveItems()
        }
    }
    private let itemKey: String = "todoData"
    
    init() {
        getItems()
    }
    
    func getItems() {
        guard let data = UserDefaults.standard.data(forKey: itemKey),
              let savedItems = try? JSONDecoder().decode([Item].self, from: data)
              else {return}
        
        items = savedItems
    }
    
    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    
    func moveItem(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func addItem(_ title: String) {
        let newItem = Item(title: title, isCompleted: false)
        items.append(newItem)
    }
    
    func changeItem(_ item: Item) {
        if let index = items.firstIndex(where: { $0.id == item.id}) {
            items[index] = item.updateCompletion()
        }
    }
    
    func saveItems() {
        let encoder = JSONEncoder()
        if let data = try? encoder.encode(items) {
            UserDefaults.standard.set(data, forKey: itemKey)
        }
        
    }
}
