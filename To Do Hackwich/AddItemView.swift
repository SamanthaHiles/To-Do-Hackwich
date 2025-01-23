//
//  AddItemView.swift
//  To Do Hackwich
//
//  Created by Samantha Hiles on 1/22/25.
//

import SwiftUI

struct AddItemView: View {
    @ObservedObject var toDoList: ToDoList
    @State private var showingAddItemView = false
    @State private var priority = ""
    @State private var description = ""
    @State private var dueDate = Date()
    @Environment(\.presentationMode) var presentationMode
    static let priorities = ["High", "Medium", "Low"]
    var body: some View {
        NavigationView {
            Form {
                Picker("Priority", selection: $priority) {
                    ForEach(Self.priorities, id: \.self) { priority in
                        Text(priority)
                    }
                }
                TextField("Description", text: $description)
                DatePicker("DueDate", selection: $dueDate, displayedComponents: .date)
            }
            .sheet(isPresented: $showingAddItemView, content: {
                AddItemView(toDoList: toDoList)
            })
            .navigationBarTitle("Add New To-Do Item", displayMode: .inline)
            .navigationBarItems(leading: EditButton(),
                                trailing: Button(action: { showingAddItemView = true
            },label: {
                Image(systemName: "plus")

            }))
        }
    }
}

#Preview {
    AddItemView(toDoList: ToDoList())
}
  
