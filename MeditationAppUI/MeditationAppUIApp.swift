//
//  MeditationAppUIApp.swift
//  MeditationAppUI
//
//  Created by Ronaldo Andre on 1/02/24.
//

import SwiftUI

@main
struct MeditationAppUIApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
