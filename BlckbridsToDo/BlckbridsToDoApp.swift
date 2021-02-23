//
//  BlckbridsToDoApp.swift
//  BlckbridsToDo
//
//  Created by Andrei Istoc on 23.02.2021.
//

import SwiftUI

@main
struct BlckbridsToDoApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
