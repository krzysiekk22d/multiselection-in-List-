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
            Text(pet.name)
                .font(.title)
                .fontWeight(.bold)
        }
    }
}

