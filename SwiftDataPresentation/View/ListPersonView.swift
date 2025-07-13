//
//  ListPersonView.swift
//  SwiftDataPresentation
//
//  Created by Belkhadir Anas on 12/7/2025.
//

import Foundation
import SwiftUI
import SwiftDataDomain

public struct ListPersonView: View {
    private let viewModel: PersonViewModel
    
    public init(viewModel: PersonViewModel) {
        self.viewModel = viewModel
    }
    
    public var body: some View {
        NavigationStack {
            List {
                if case .loaded(let persons) = viewModel.viewState {
                    ForEach(persons) { person in
                        Text(person.name)
                    }
                    .onDelete(perform: viewModel.deletePerson)
                }
            }
            .overlay(overlayContent)
            .navigationTitle("People")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        let newPerson = Person(name: "John Doe \(Int.random(in: 1...100))")
                        viewModel.addPerson(newPerson)
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
        }
        .onAppear(perform: viewModel.onAppear)
    }
}

// MARK: - Helpers
private extension ListPersonView {
    @ViewBuilder
    var overlayContent: some View {
        switch viewModel.viewState {
        case .error(let error):
            VStack(spacing: 8) {
                Image(systemName: "exclamationmark.triangle")
                    .font(.largeTitle)
                    .foregroundColor(.red)
                Text("Something went wrong")
                    .font(.headline)
                Text(error.localizedDescription)
                    .font(.subheadline)
                    .multilineTextAlignment(.center)
            }
            .padding()
            
        case .loaded(let persons) where persons.isEmpty:
            VStack(spacing: 8) {
                Image(systemName: "person.crop.circle.badge.xmark")
                    .font(.largeTitle)
                    .foregroundColor(.gray)
                Text("No people found")
                    .font(.headline)
                Text("Tap '+' to add your first person.")
                    .font(.subheadline)
            }
            .padding()
            
        default:
            EmptyView()
        }
    }
}
