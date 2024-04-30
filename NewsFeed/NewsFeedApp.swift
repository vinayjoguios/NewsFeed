//
//  NewsFeedApp.swift
//  NewsFeed

import SwiftUI

@main
struct NewsFeedApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
