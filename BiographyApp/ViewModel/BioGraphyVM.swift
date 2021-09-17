//
//  BioGraphyVM.swift
//  BiographyApp
//
//  Created by Muneer KK on 18/09/21.
//

import Foundation

protocol RandomWords {
    func getRandomWord()->String
}

protocol WordsCount {
    func calculateWordsCount(_ inputText:String)->Int
}

class BioGraphyVM: ObservableObject,RandomWords,WordsCount {
 
    func calculateWordsCount(_ inputText:String)->Int {
        let words = inputText.split { $0 == " " || $0.isNewline }
        return words.count
    }
    
    func getRandomWord()->String {
        //MARK:random word length => 5 character
        var randomWord = "";
        for _ in 0..<5{
            let string = String(format: "%c", Int.random(in: 97..<123)) as String
            randomWord+=string
        }
        return randomWord
    }
}
