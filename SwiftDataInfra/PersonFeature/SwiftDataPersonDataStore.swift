//
//  SwiftDataPersonDataStore.swift
//  SwiftDataInfra
//
//  Created by Belkhadir Anas on 12/7/2025.
//

import Foundation
import SwiftData
import SwiftDataDomain

public final class SwiftDataPersonDataStore {
    private let modelContext: ModelContext
    
    public init(modelContext: ModelContext) {
        self.modelContext = modelContext
    }
}

// MARK: - PersonDataStore
extension SwiftDataPersonDataStore: PersonDataStore {
    public func fetchAll() throws -> [Person] {
        let request = FetchDescriptor<LocalePerson>(sortBy: [SortDescriptor(\.name)])
        let results = try modelContext.fetch(request)
        
        return results.map { Person(name: $0.name) }
    }
    
    public func save(_ person: Person) throws {
        let localPerson = LocalePerson(name: person.name)
        
        modelContext.insert(localPerson)
        try modelContext.save()
    }
    
    public func delete(_ person: Person) throws {
        let request = FetchDescriptor<LocalePerson>(sortBy: [SortDescriptor(\.name)])
        let results = try modelContext.fetch(request)
        guard let localPerson = results.first else { return }
        
        modelContext.delete(localPerson)
        try modelContext.save()
    }
}
