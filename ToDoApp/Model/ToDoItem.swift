//
//  ToDoItem.swift
//  ToDoApp
//
//  Created by Hüseyin Umut Kardaş on 31.08.2024.
//

import Foundation
import SwiftData

@Model
class ToDoItem: Identifiable {
    let id: String
    let title: String
    var isCompleted: Bool

    init(id: String, title: String, isCompleted: Bool) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }
}
