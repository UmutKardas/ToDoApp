//
//  ToDoViewHeader.swift
//  ToDoApp
//
//  Created by Hüseyin Umut Kardaş on 31.08.2024.
//

import SwiftUI

struct ToDoViewHeader: View {
    @Binding var textField: String
    var onSubmit: () -> Void
    var body: some View {
        VStack {
            Text("What`s Up!")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(Color("TextColor"))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 20)

            TextField("Add a new Task", text: $textField)
                .padding()
                .background(Color.white)
                .autocorrectionDisabled(true)
                .overlay {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.white, lineWidth: /*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/)
                }
                .cornerRadius(10)
                .onSubmit {
                    onSubmit()
                }
                .padding(.horizontal)
        }
    }
}

#Preview {
    ToDoViewHeader(textField: Binding<String>.constant(""), onSubmit: {})
}
