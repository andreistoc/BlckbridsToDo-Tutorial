//
//  TasksView.swift
//  BlckbridsToDo
//
//  Created by Andrei Istoc on 23.02.2021.
//

import SwiftUI

struct TasksView: View {
    
    var rowHeight: CGFloat = 50
    var sampleTasks = ["Task One", "Task Two", "Task Three"]
    
    
    @Environment(\.managedObjectContext) var viewContext
    @FetchRequest(entity: ToDoItem.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \ToDoItem.createdAt, ascending: false)], predicate: NSPredicate(format: "taskDone = %d", false), animation: .default)
    
    var fetchedItems: FetchedResults<ToDoItem>
    
    @State var newTaskTitle = ""
    
    var body: some View {
        List {
            ForEach(fetchedItems, id: \.self) { item in
                HStack {
                    Text(item.taskTitle ?? "Empty")
                    Spacer()
                    Image(systemName: "circle")
                        .imageScale(.large)
                        .foregroundColor(.gray)
                }
            }.frame(height: rowHeight)
            
            HStack{
                TextField("Add task...", text: $newTaskTitle, onCommit: {print("New task title entered.")})
                Button(action: {
                    saveTask()
                }, label: {
                    Image(systemName: "plus").imageScale(.large)
                })
                
            }.frame(height: rowHeight)
            
            Text("Tasks done").frame(height: rowHeight)
            
        }.listStyle(GroupedListStyle())
    }
    
    
    func saveTask () {
        guard self.newTaskTitle != "" else { return }
        
        let newToDoItem = ToDoItem(context: viewContext)
        
        newToDoItem.taskTitle = newTaskTitle
        newToDoItem.createdAt = Date()
        newToDoItem.taskDone = false
        
        do {
            try viewContext.save()
        } catch {
            print(error.localizedDescription)
        }
        
        newTaskTitle = ""
    }
}

struct TasksView_Previews: PreviewProvider {
    static var previews: some View {
        TasksView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
