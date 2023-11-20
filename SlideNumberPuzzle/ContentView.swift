//
//  ContentView.swift
//  SlideNumberPuzzle
//
//  Created by Nutchapon Kitkram on 20/11/2566 BE.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var gameModel : GameModel
    let gridSize:Int = 16
    var body: some View {
        VStack() {
            Spacer()
            Text("Number Slide Puzzle")
                .font(.system(size: 32))
                .foregroundColor(.white)
                .font(.largeTitle)
                .bold()
                .shadow(color: .black, radius: 2, x: 0, y: 2)
            Spacer()
            cards
                .animation(.default, value: gameModel.cards)
                .foregroundColor(Color(#colorLiteral(red: 0.1921568661928177, green: 0.2431372553110123, blue: 0.45490196347236633, alpha: 1)))
            Spacer()
            Text(gameModel.hasWon ? "You Won!!!" : "")
                .foregroundColor(.green)
                .font(.largeTitle).bold()
                .shadow(color: .black, radius: 2, x: 0, y: 2)
                .font(.system(size: 36))
            
            Spacer()
            HStack(){
                Text("Moves: \(gameModel.moveCount)")
                    .foregroundColor(.white)
                    .font(.title).bold()
                Spacer(minLength: 5)
                Button("New Game"){
                    gameModel.newGame()
                }
                .font(.title)
                .padding()
                .foregroundColor(.white)
                .background(.blue)
                .cornerRadius(12)
                
            }
         
        }
        .padding()
        .background(Color(#colorLiteral(red: 0.1921568661928177, green: 0.2431372553110123, blue: 0.45490196347236633, alpha: 1)))
    }

    var cards: some View{
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))], spacing: 10){
            createCards()
        }
    }
    
    func createCards() -> some View{
        ForEach(gameModel.cards){ card in
            CardView(card: card)
                .aspectRatio(1, contentMode: .fit)
                .onTapGesture {
                    gameModel.moveNumber(card)
                }
        }
    }
}

struct CardView: View{
    let card: CardCollection<String>.Card
    var body: some View{
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            if card.content != "0"{
                Group {
                    base.foregroundColor(.white)
                    base.strokeBorder(lineWidth: 2)
                    Text(card.content).font(.largeTitle)
                        .bold()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(gameModel : GameModel())
    }
}
