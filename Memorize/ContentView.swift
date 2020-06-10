//
//  ContentView.swift
//  Memorize
//
//  Created by Subhash Yadav on 08/06/20.
//  Copyright © 2020 Subhash Yadav. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var viewModel: EmojiMemoryGame
    var body: some View {
        HStack{
            ForEach(viewModel.cards){card in
               CardView(card: card)
            }
        }
       .padding()
       .foregroundColor(Color.orange)
    }
}
struct CardView: View{
    var card: MemoryGame<String>.Card
    var body: some View{
        
        ZStack{
            if(card.isFaceUp)
            {
                RoundedRectangle(cornerRadius: 10.0).fill(Color.white)
                RoundedRectangle(cornerRadius: 10.0).stroke().stroke(lineWidth: 3.0)
                Text(card.content)
            }
            else
            {
                RoundedRectangle(cornerRadius: 10.0).fill(Color.orange)
            }
                                     }
    }
}





















struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: EmojiMemoryGame())
    }
}
