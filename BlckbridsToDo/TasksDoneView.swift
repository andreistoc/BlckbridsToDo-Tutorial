//
//  TasksDoneView.swift
//  BlckbridsToDo
//
//  Created by Andrei Istoc on 23.02.2021.
//

import SwiftUI

struct TasksDoneView: View {
    
    @Environment(\.managedObjectContext) var viewContext
    
    @FetchRequest(entity: ToDoItem.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \ToDoItem.createdAt, ascending: false)], predicate: NSPredicate(format: "taskDone = %d", true), animation: .default)
    
    var fetchedItems: FetchedResults<ToDoItem>
    
    var body: some View {
        List {
            HStack {
                    Text(item.taskTitle ?? "Empty")
                    Spacer()
                    Image(systemName: "checkmark.circle.fill")
                        .imageScale(.large)
                        .foregroundColor(.blue)
                }
                    .frame(height: rowHeight)
            }.navigationBarTitle(Text("Tasks done"))
        .listStyle(GroupedListStyle())
    }
}

struct TasksDoneView_Previews: PreviewProvider {
    static var previews: some View {
        TasksDoneView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
