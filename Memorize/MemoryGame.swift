//
//  File.swift
//  Memorize
//
//  Created by Subhash Yadav on 09/06/20.
//  Copyright © 2020 Subhash Yadav. All rights reserved.
//

import Foundation

struct MemoryGame<CardContent> where CardContent:Equatable {
    var cards: Array<Card>
    
    var indexOfOneAndOnlyOne: Int?
     var score: Int = 0;
  mutating  func choose(card:Card)  {
       // print("card chhosed \(card)")
       // card.isFaceUp = !card.isFaceUp
    if  let chooseIndex:  Int = cards.firstIndex(matching: card), !cards[chooseIndex].isFaceUp, !cards[chooseIndex].isMatched
    {
        if let potentialMatchIndex = indexOfOneAndOnlyOne{
            if cards[chooseIndex].content == cards[potentialMatchIndex].content{
                cards[chooseIndex].isMatched = true
                cards[potentialMatchIndex].isMatched = true
                score = score+1;
              
            }
           indexOfOneAndOnlyOne = nil
        }else{
            for index in cards.indices{
                cards[index].isFaceUp=false;
            }
            indexOfOneAndOnlyOne = chooseIndex
        }
        self.cards[chooseIndex].isFaceUp = true

    }
    }
  
    
    init(numOfPairs: Int, cardContentFactory: (Int) -> CardContent  ) {
        cards =  Array<Card>()
        
        for index in 0..<numOfPairs{
            let content = cardContentFactory(index)
            cards.append(Card(content: content,id: index*2))
            cards.append(Card(content: content,id: index*2+1))
            
        }
        cards.shuffle()
    }
    
    
    struct Card: Identifiable {
        var isFaceUp: Bool = false;
        var isMatched: Bool = false;
        var content: CardContent
        var id: Int
        
        
    }
}
