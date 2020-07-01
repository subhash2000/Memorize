//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Subhash Yadav on 09/06/20.
//  Copyright © 2020 Subhash Yadav. All rights reserved.
//

import Foundation

//func createCardContent(
class EmojiMemoryGame: ObservableObject{
  @Published private  var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    
    static func createMemoryGame() -> MemoryGame<String>
    {
        let emojis : Array<String> = ["👻","🎃","🕷","😊","😍","👻","🎃","🕷","😊","🎃","🕷","😊"]
        return MemoryGame<String>(numOfPairs: emojis.count){ pairIndex in
            return emojis[pairIndex]
        }
        
        
    }
    
    // MARK: - Model  
    var cards: Array<MemoryGame<String>.Card>{
      return  model.cards
    }
    
    
    // MARK: - Intent
    
    func choose(card: MemoryGame<String>.Card){
        model.choose(card: card)
    }
    
    func createNewGame(){
        model = EmojiMemoryGame.createMemoryGame()
    }
}
