//
//  PersonViewModel.swift
//  SwiftDataPresentation
//
//  Created by Belkhadir Anas on 12/7/2025.
//

import Foundation
import SwiftDataDomain

public enum ViewState<T> {
    case idle
    case loaded(T)
    case error(Error)
}

@Observable
public final class PersonViewModel {
    private let personDataStore: PersonDataStore
    
    public private(set) var viewState: ViewState<[Person]> = .idle
    
    public init(personDataStore: PersonDataStore) {
        self.personDataStore = personDataStore
    }
}

extension PersonViewModel {
    public func onAppear() {
        viewState = .loaded(allPersons())
    }
    
    public func addPerson(_ person: Person) {
        perform { try personDataStore.save(person) }
    }

    public func deletePerson(at offsets: IndexSet) {
        switch viewState {
        case .loaded(let people) where !people.isEmpty:
            for index in offsets {
                let person = people[index]
                perform { try personDataStore.delete(person) }
            }
        default:
            break
        }
    }
}

// MARK: - Helpers
private extension PersonViewModel {
    func allPersons() -> [Person] {
        do {
            return try personDataStore.fetchAll()
        } catch {
            return []
        }
    }
    
    func perform(_ action: () throws -> Void) {
        do {
            try action()
            viewState = .loaded(allPersons())
        } catch {
            viewState = .error(error)
        }
    }
}
