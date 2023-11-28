//
//  ContentView.swift
//  selection
//
//  Created by Krzysztof Czura on 27/11/2023.
//

import SwiftUI

struct ContentView: View {
    var pets = Pet.dummyData()
    
    @State var selectedRows = Set<UUID>()
    @State var isEditing = false
    
    var body: some View {
        NavigationView {
            List(pets, selection: $selectedRows) { pet in
                MultiSelectRow(pet: pet, selectedItems: $selectedRows)
                }
                .navigationBarItems(trailing: Button(action: {
                    // code for the action
                    isEditing.toggle()
                    if !self.isEditing {
                        // when a user taps "DONE"
                        print("Items selected: \(self.selectedRows)")
                    }
                }, label: {
                    if self.isEditing {
                        Text("Done").foregroundStyle(.red)
                    } else {
                        Text("Edit").foregroundStyle(.blue)
                    }
                }))
                .environment(\.editMode, .constant(self.isEditing ? EditMode.active : EditMode.inactive))
                .animation(.spring, value: UUID())
                .navigationBarTitle(Text("Selected \(selectedRows.count) rows"))
        }
    }
}

#Preview {
    ContentView()
}
