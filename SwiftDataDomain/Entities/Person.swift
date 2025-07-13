//
//  Person.swift
//  SwiftDataDomain
//
//  Created by Belkhadir Anas on 12/7/2025.
//

import Foundation

public struct Person: Identifiable {
    public var id: UUID = UUID()
    
    public let name: String
    
    public init(name: String) {
        self.name = name
    }
}
