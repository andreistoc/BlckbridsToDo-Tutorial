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
    
    @State var newTaskTitle = ""
    
    var body: some View {
        List {
            ForEach(sampleTasks, id: \.self) { item in
                HStack {
                    Text(item)
                    Spacer()
                    Image(systemName: "circle")
                        .imageScale(.large)
                        .foregroundColor(.gray)
                }
            }.frame(height: rowHeight)
            
            HStack{
                TextField("Add task...", text: $newTaskTitle, onCommit: {print("New task title entered.")})
                Image(systemName: "plus").imageScale(.large)
            }.frame(height: rowHeight)
            
            Text("Tasks done").frame(height: rowHeight)
            
        }.listStyle(GroupedListStyle())
    }
}

struct TasksView_Previews: PreviewProvider {
    static var previews: some View {
        TasksView()
    }
}
