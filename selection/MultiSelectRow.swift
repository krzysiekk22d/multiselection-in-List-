//
//  MultiSelectRow.swift
//  selection
//
//  Created by Krzysztof Czura on 28/11/2023.
//

import SwiftUI

struct MultiSelectRow: View {
    var word: Word
    var blurRadius: CGFloat
    @Binding var selectedItems: Set<String>
    
    var body: some View {
        HStack {
            Text(word.leftPart)
                .blur(radius: blurRadius)
            Spacer()
            Text(word.rightPart)
                .foregroundStyle(Color.green)
                .italic()
                .blur(radius: blurRadius)
        }
        .onTapGesture {
            toggleSelection()
        }
    }
    
    private func toggleSelection() {
        if selectedItems.contains(word.id) {
            selectedItems.remove(word.id)
        } else {
            selectedItems.insert(word.id)
        }
    }
}

