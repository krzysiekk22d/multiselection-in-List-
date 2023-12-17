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
    var isBeingEdited: Bool
    var isTrash: Bool
    @Binding var selectedItems: Set<String>
    
    var body: some View {
        HStack {
            if isBeingEdited {
                if selectedItems.contains(word.id) {
                    ZStack {
                        Circle()
                            .frame(width: 20, height: 20)
                            .foregroundStyle(.white)
                        if isTrash {
                            Image(systemName: "minus.circle.fill")
                                .foregroundStyle(.red)
                                .font(.system(size: 20))
                        } else {
                            Image(systemName: "checkmark.circle.fill")
                                .foregroundStyle(.blue)
                                .font(.system(size: 20))
                        }
                    }
                } else {
                    Image(systemName: "circle")
                        .foregroundStyle(.gray)
                        .opacity(0.5)
                        .font(.system(size: 20))
                }
            }
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

