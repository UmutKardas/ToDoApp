//
//  ToDoListView.swift
//  ToDoApp
//
//  Created by Hüseyin Umut Kardaş on 31.08.2024.
//

import SwiftUI

struct ToDoListView: View {
    var toDoItem: [ToDoItem]
    var updateItem: (ToDoItem) -> Void

    var body: some View {
        List {
            Section {
                ForEach(toDoItem) { item in
                    ToDoListItemView(item: item) {
                        updateItem(item)
                    }
                    .background(Color(.systemBackground))
                    .cornerRadius(10)
                    .overlay {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.white, lineWidth: 1)
                    }
                    .listRowBackground(Color.clear)
                }
                .listRowSeparator(.hidden)
            }
        }
        .listStyle(PlainListStyle())
        .padding(.horizontal, 5)
    }
}
