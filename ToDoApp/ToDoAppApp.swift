//
//  ToDoAppApp.swift
//  ToDoApp
//
//  Created by Hüseyin Umut Kardaş on 31.08.2024.
//

import SwiftData
import SwiftUI

@main
struct ToDoAppApp: App {
    var body: some Scene {
        WindowGroup {
            ToDoView()
        }
        .modelContainer(for: ToDoItem.self)
    }
}
