//
//  ContentView.swift
//  selection
//
//  Created by Krzysztof Czura on 27/11/2023.
//

import SwiftUI

struct ContentView: View {
    var pets = Pet.dummyData()
    
    @State private var selectedRows = Set<UUID>()
    @State private var isEditing = false
    
    var body: some View {
        NavigationView {
            List(pets, selection: $selectedRows) { pet in
                MultiSelectRow(pet: pet, selectedItems: $selectedRows)
            }
            .toolbar {
                Button(action: {
                    // code for the action
                    isEditing.toggle()
                }, label: {
                    if isEditing {
                        Text("Done").foregroundStyle(.red)
                    } else {
                        Text("Edit").foregroundStyle(.blue)
                    }
                })
            }
            .environment(\.editMode, .constant(isEditing ? EditMode.active : EditMode.inactive))
            .animation(.spring, value: isEditing) // Zaktualizowano wartość animacji
            .navigationBarTitle(Text("Selected \(selectedRows.count) rows"))
            .onChange(of: isEditing) { _, _ in
                if !isEditing {
                    // when a user taps "DONE"
                    printSelectedPets()
                }
            }
        }
    }
    
    private func printSelectedPets() {
        let selectedPetNames = pets.filter { selectedRows.contains($0.id) }.map { $0.name }
        print("Items selected: \(selectedPetNames)")
    }
}

#Preview {
    ContentView()
}
