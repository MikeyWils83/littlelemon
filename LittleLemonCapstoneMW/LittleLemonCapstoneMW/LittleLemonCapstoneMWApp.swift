//
//  LittleLemonCapstoneMWApp.swift
//  LittleLemonCapstoneMW
//
//  Created by Michael Wilson on 8/6/23.
//

import SwiftUI

@main
struct LittleLemonCapstoneMWApp: App {
    
    @StateObject var appState = AppState()
    
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(appState)
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
            
        }
    }
}
