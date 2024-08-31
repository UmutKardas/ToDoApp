//
//  ToDoViewModel.swift
//  ToDoApp
//
//  Created by Hüseyin Umut Kardaş on 31.08.2024.
//

import SwiftData
import SwiftUI

final class ToDoViewModel: ObservableObject {
    @Published var toDoItems: [ToDoItem]?
    @Published var textField: String = ""
    var modelContext: ModelContext?

    func setupContext(modelContext: ModelContext) {
        self.modelContext = modelContext
        fetchItems()
    }

    func fetchItems() {
        guard let modelContext = modelContext else { return }

        do {
            let descriptor = FetchDescriptor<ToDoItem>()
            toDoItems = try modelContext.fetch(descriptor)
        }
        catch {
            print(error.localizedDescription)
        }
    }

    func addItem() {
        guard !textField.isEmpty else { return }
        let newItem = ToDoItem(id: UUID().uuidString, title: textField, isCompleted: false)
        modelContext?.insert(newItem)
        saveContext()
        textField = ""
    }

    func updateItem(item: ToDoItem) {
        item.isCompleted.toggle()
        saveContext()
    }

    private func saveContext() {
        do {
            try modelContext?.save()
            fetchItems()
        }
        catch {
            print(error.localizedDescription)
        }
    }
}
