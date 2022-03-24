//
//  MemoryGame.swift
//  Memorize
//
//  Created by Sharun Garg on 2022-03-23.
//

import Foundation

struct MemoryGame<CardContent> {
    private(set) var cards: [Card]
    
    mutating func choose(_ card: Card) {
        let cardIndex = index(of: card)
        cards[cardIndex].isFaceUp.toggle()
        print("hello")
    }
    
    func index(of card: Card) -> Int {
        for cardIndex in 0..<cards.count {
            if cards[cardIndex].id == card.id { return cardIndex }
        }
        return 0
    }
    
    init (numberOfPairsOfCards: Int, getCardContent: (Int) -> CardContent){
        cards = Array<Card>()
        for cardIndex in 0..<numberOfPairsOfCards {
            let cardContent = getCardContent(cardIndex)
            cards.append(Card(content: cardContent, id: cardIndex*2))
            cards.append(Card(content: cardContent, id: cardIndex*2+1))
        }
    }
    
    struct Card: Identifiable {
        var isFaceUp: Bool = true
        var isMatched: Bool = false
        var content: CardContent
        var id: Int
    }
}
