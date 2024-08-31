//
//  ToDoView.swift
//  ToDoApp
//
//  Created by Hüseyin Umut Kardaş on 31.08.2024.
//

import SwiftData
import SwiftUI

struct ToDoView: View {
    @Environment(\.modelContext) var modelContext
    @StateObject var viewModel: ToDoViewModel = .init()

    var body: some View {
        VStack {
            ToDoViewHeader(textField: $viewModel.textField) {
                viewModel.addItem()
            }
            Text("Today`s Task")
                .font(.headline)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 25)
                .padding(.top, 25)

            if let toDoItems = viewModel.toDoItems {
                ToDoListView(toDoItem: toDoItems) { item in
                    viewModel.updateItem(item: item)
                }
            }
        }
        .onAppear {
            viewModel.setupContext(modelContext: modelContext)
        }
        .background(Color("BackgroundColor"))
    }
}

#Preview {
    ToDoView()
        .modelContainer(for: ToDoItem.self)
}
