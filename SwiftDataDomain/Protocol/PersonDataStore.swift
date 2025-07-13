//
//  PersonDataStore.swift
//  SwiftDataDomain
//
//  Created by Belkhadir Anas on 12/7/2025.
//

public protocol PersonDataStore {
    func fetchAll() throws -> [Person]
    func save(_ person: Person) throws
    func delete(_ person: Person) throws
}
