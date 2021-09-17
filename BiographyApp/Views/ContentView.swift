//
//  ContentView.swift
//  BiographyApp
//
//  Created by Muneer KK on 18/09/21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var bioGraphyVM = BioGraphyVM()
    @State private var inputText = ""
    @State private var wordCount: Int = 0
 
    var body: some View {
        Text((AppConstants.appTitle))
            .font(.headline)
            .foregroundColor(.primary)
            .padding(.leading)
        ZStack(alignment: .topTrailing) {
           
            TextEditor(text: $inputText)
                .font(.body)
                .padding()
                .padding(.top, 20)
                .onChange(of: inputText) { value in
                   
                    self.wordCount = bioGraphyVM.calculateWordsCount(inputText)
                }
            Text("\(wordCount) \(AppConstants.words)")
                .font(.headline)
                .foregroundColor(.secondary)
                .padding(.trailing)
        }
        Section {
            if !inputText.isEmpty {
                List {
                    Button(action: {
                        inputText = inputText + " " + bioGraphyVM.getRandomWord()
                                      
                                    }) {
                                        Text(bioGraphyVM.getRandomWord())
                                    }
                }
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
