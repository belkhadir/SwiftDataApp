//
//  SwiftDataInfraContainerFactory.swift
//  SwiftDataInfra
//
//  Created by Belkhadir Anas on 12/7/2025.
//

import Foundation
import SwiftData

public struct SwiftDataInfraContainerFactory {
    public static func makeContainer() throws -> ModelContainer {
        let schema = Schema([LocalePerson.self])
        return try ModelContainer(for: schema)
    }
}
