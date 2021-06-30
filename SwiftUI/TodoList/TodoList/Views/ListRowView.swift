//
//  ListRowView.swift
//  TodoList
//
//  Created by Sophia Lu on 6/28/21.
//

import SwiftUI

struct ListRowView: View {
    let item: Item
    
    var body: some View {
        HStack {
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                .foregroundColor(item.isCompleted ? .green : .red)
            Text(item.title)
        }
        .font(.title3)
        .padding(.vertical, 8)
    }
}

struct ListRowView_Previews: PreviewProvider {
    static var previews: some View {
        ListRowView(item: Item(title: "item 1", isCompleted: false))
            .previewLayout(.sizeThatFits)
    }
}
