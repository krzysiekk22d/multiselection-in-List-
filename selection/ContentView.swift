//
//  ContentView.swift
//  selection
//
//  Created by Krzysztof Czura on 27/11/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var words: [Word] = [
            Word(id: "a", leftPart: "aa", rightPart: "aaa"), Word(id: "b", leftPart: "bb", rightPart: "bbb"), Word(id: "c", leftPart: "cc", rightPart: "ccc"), Word(id: "d", leftPart: "dd", rightPart: "ddd"), Word(id: "e", leftPart: "ee", rightPart: "eee"), Word(id: "f", leftPart: "ff", rightPart: "fff"), Word(id: "g", leftPart: "gg", rightPart: "ggg"), Word(id: "h", leftPart: "hh", rightPart: "hhh"), Word(id: "i", leftPart: "ii", rightPart: "iii"), Word(id: "j", leftPart: "jj", rightPart: "jjj"), Word(id: "k", leftPart: "kk", rightPart: "kkk"), Word(id: "l", leftPart: "ll", rightPart: "lll"), Word(id: "m", leftPart: "mm", rightPart: "mmm")]

    @State private var selectedRows = Set<String>()
    @State private var isBeingEdited = false
    @State private var buttonName = "Done"

    var body: some View {
        NavigationView {
            List(selection: $selectedRows) {
                ForEach(words.sorted(by: { $0.leftPart < $1.leftPart }), id: \.id) { word in
                    MultiSelectRow(word: word, blurRadius: 0, selectedItems: $selectedRows)
                }
            }
            .toolbar {
                if !isBeingEdited {
                    Button {
                        buttonName = "Delete"
                        isBeingEdited = true
                    } label: {
                        Text("Delete").foregroundStyle(.blue)
                    }
                }

                if !isBeingEdited {
                    Button {
                        buttonName = "Move"
                        isBeingEdited = true
                    } label: {
                        Text("Move").foregroundStyle(.blue)
                    }
                }

                if isBeingEdited {
                    Button {
                        isBeingEdited = false
                        printSelectedWords()
                    } label: {
                        let color: Color = (buttonName == "Delete") ? .red : .blue
                        Text(buttonName)
                            .foregroundStyle(color)
                    }
                }
            }
            .environment(\.editMode, .constant(isBeingEdited ? EditMode.active : EditMode.inactive))
            .animation(.spring, value: isBeingEdited)
            .navigationBarTitle(Text("Selected \(selectedRows.count) rows"))
        }
    }

    private func printSelectedWords() {
        let selectedWordIDs = Array(selectedRows)
        print("Items selected: \(selectedWordIDs)")
    }
}

#Preview {
    ContentView()
}
