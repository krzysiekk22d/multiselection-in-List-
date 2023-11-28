//
//  MultiSelectRow.swift
//  selection
//
//  Created by Krzysztof Czura on 28/11/2023.
//

import SwiftUI

struct MultiSelectRow: View {
    
    var pet: Pet
    @Binding var selectedItems: Set<UUID>
    var isSelected: Bool {
        selectedItems.contains(pet.id)
    }
    
    var body: some View {
        HStack {
            Text(self.pet.name)
                .font(.title)
                .fontWeight(.bold)
            Spacer()
            if self.isSelected {
                Image(systemName: "checkmark")
                    .foregroundColor(Color.blue)
            }
        }
        .onTapGesture {
            if self.isSelected {
                self.selectedItems.remove(self.pet.id)
            } else {
                self.selectedItems.insert(self.pet.id)
            }
        }
    }
}
