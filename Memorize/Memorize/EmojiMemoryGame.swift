//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Sharun Garg on 2022-03-23.
//

import Foundation

class EmojiMemoryGame: ObservableObject {
    static private let emojis = ["⚽️","🏀","🏈","⚾️","🥎","🎾","🏐","🏉","🥏","🎱", "🥋","🎽","🛼","🥌","🥊","⛳️","🎭","🎨","🎮","🎳"]
    
    static private func generateMemoryGame() -> MemoryGame<String> {
        return MemoryGame<String>(numberOfPairsOfCards: 4) {
            pairIndex in emojis[pairIndex]
        }
    }
    
    @Published private var model: MemoryGame<String> = generateMemoryGame()
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
    
    var cards: [MemoryGame<String>.Card] {
        return model.cards
    }
}
