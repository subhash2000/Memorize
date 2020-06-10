//
//  File.swift
//  Memorize
//
//  Created by Subhash Yadav on 09/06/20.
//  Copyright © 2020 Subhash Yadav. All rights reserved.
//

import Foundation

struct MemoryGame<CardContent> {
    var cards: Array<Card>
    
    func choose(card:Card)  {
        print("card chhosed \(card)")
    }
    
    init(numOfPairs: Int, cardContentFactory: (Int) -> CardContent  ) {
        cards =  Array<Card>()
        
        for index in 0..<numOfPairs{
            let content = cardContentFactory(index)
            cards.append(Card(content: content,id: index*2))
            cards.append(Card(content: content,id: index*2+1))
            
        }
    }
    
    
    struct Card: Identifiable {
        var isFaceUp: Bool = true;
        var isMatched: Bool = true;
        var content: CardContent
        var id: Int
        
    }
}

