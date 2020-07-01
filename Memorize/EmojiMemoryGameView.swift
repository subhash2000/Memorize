//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Subhash Yadav on 08/06/20.
//  Copyright © 2020 Subhash Yadav. All rights reserved.
//

import SwiftUI

struct EmojiMemoryGameView: View {
  @ObservedObject  var viewModel: EmojiMemoryGame
       var score: Int = 0
    var body: some View {
     
        VStack{
            Grid(viewModel.cards){card in
                           CardView(card: card) .onTapGesture {
                            withAnimation(Animation.linear(duration: 2)){
                                 self.viewModel.choose(card: card)
                            }
                           }
                   .padding(5)
                       }
                  .padding()
                  .foregroundColor(Color.orange)
            
          //  TextField("Score", text: self.$viewModel.)
           // TextField("Score ",text: score)
            
            Button(action: {
                self.viewModel.createNewGame()
            }, label: { Text("New Game").font(Font.largeTitle)})
        }
    }
}
struct CardView: View{
    var card: MemoryGame<String>.Card
    var body: some View{
        GeometryReader{ geomtery in
            ZStack{
                if(self.card.isFaceUp)
                    {
                        RoundedRectangle(cornerRadius: 10.0).fill(Color.white)
                        RoundedRectangle(cornerRadius: 10.0).stroke().stroke(lineWidth: 3.0)
                        Text(self.card.content)
                           .rotationEffect(Angle.degrees(self.card.isMatched ? 360:0))
                          
                          .animation(self.card.isMatched ? Animation.linear(duration:1).repeatForever(autoreverses: false) : .default)
                    }
            else{
                    
                       if !self.card.isMatched
                    {
                         RoundedRectangle(cornerRadius: 10.0).fill(Color.orange)
                    }
                    
                }
            }.font(Font.system(size: min(geomtery.size.width,geomtery.size.height)*0.75 ))
                
                .transition(AnyTransition.scale)
//                .rotation3DEffect(Angle.degrees(self.card.isFaceUp ? 100:0), axis: (0,1,0))
            
        }
    
    }
}





















struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView(viewModel: EmojiMemoryGame())
    }
}
