//
//  SwiftDataAppApp.swift
//  SwiftDataApp
//
//  Created by Belkhadir Anas on 12/7/2025.
//

import SwiftUI
import SwiftData
import SwiftDataInfra
import SwiftDataPresentation

@main
struct SwiftDataAppApp: App {
    let container: ModelContainer

    init() {
        do {
            container = try SwiftDataInfraContainerFactory.makeContainer()
        } catch {
            fatalError("Failed to initialize ModelContainer: \(error)")
        }
    }
    
    var body: some Scene {
        WindowGroup {
            ListPersonViewContructionView.construct(container: container)
        }
    }
}

final class ListPersonViewContructionView {
    static func construct(container: ModelContainer) -> some View {
        let dataStore = SwiftDataPersonDataStore(modelContext: container.mainContext)
        let viewModel = PersonViewModel(personDataStore: dataStore)
        
        return ListPersonView(viewModel: viewModel)
    }
}
