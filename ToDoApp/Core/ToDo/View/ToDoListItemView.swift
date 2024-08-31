//
//  ToDoListItemView.swift
//  ToDoApp
//
//  Created by Hüseyin Umut Kardaş on 31.08.2024.
//

import SwiftUI

struct ToDoListItemView: View {
    var item: ToDoItem
    var updateItem: () -> Void

    var body: some View {
        HStack {
            Button {
                updateItem()
            } label: {
                Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                    .resizable()
                    .clipShape(Circle())
                    .foregroundColor(Color(.systemBlue))
                    .frame(width: 25, height: 25)
            }

            Text(item.title)
                .foregroundColor(.primary)
                .strikethrough(item.isCompleted, color: .black)
                .padding(.leading, 5)
        }
        .frame(maxWidth: .infinity, minHeight: 50, alignment: .leading)
        .padding(.leading, 5)
    }
}
