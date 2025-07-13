//
//  LocalePerson.swift
//  SwiftDataInfra
//
//  Created by Belkhadir Anas on 12/7/2025.
//

import Foundation
import SwiftData

@Model
final class LocalePerson: Identifiable {
    @Attribute(.unique) var name: String

    init(name: String) {
        self.name = name
    }
}
