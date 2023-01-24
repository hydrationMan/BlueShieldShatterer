//
//  BlueShieldShattererApp.swift
//  BlueShieldShatterer
//
//  Created by Hydrate on 6/01/23.
//

import SwiftUI

@main
struct BlueShieldShattererApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
