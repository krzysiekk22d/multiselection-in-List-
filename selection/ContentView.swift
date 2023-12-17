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
    @State private var buttonName = "Done"
    
    var body: some View {
        NavigationView {
            List(pets, selection: $selectedRows) { pet in
                MultiSelectRow(pet: pet, selectedItems: $selectedRows)
            }
            .toolbar {
                
                if !isEditing {
                    Button {
                        buttonName = "Delete"
                        isEditing = true
                    } label: {
                        Text("Delete").foregroundStyle(.blue)
                    }
                }
                
                if !isEditing {
                    Button {
                        buttonName = "Move"
                        isEditing = true
                    } label: {
                        Text("Move").foregroundStyle(.blue)
                    }
                }
                
                if !isEditing {
                    Button {
                        buttonName = "Share"
                        isEditing = true
                    } label: {
                        Text("Share").foregroundStyle(.blue)
                    }
                }
                
                if isEditing {
                    Button {
                        isEditing = false
                    } label: {
                        let color: Color = (buttonName == "Delete") ? .red : .blue
                        Text(buttonName)
                            .foregroundStyle(color)
                    }
                }
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
