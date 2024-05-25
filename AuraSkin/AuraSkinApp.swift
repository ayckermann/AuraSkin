//
//  AuraSkinApp.swift
//  AuraSkin
//
//  Created by Ayatullah Ma'arif on 06/05/24.
//

import SwiftUI

@main
struct AuraSkinApp: App {
    // MARK: Core data
    @StateObject private var manager: CoreDataManager = CoreDataManager()
    
    var body: some Scene {
        WindowGroup {
            ViewController()
                // MARK: Core data
                .environmentObject(manager)
                .environment(\.managedObjectContext, manager.container.viewContext)
        }
    }
}
