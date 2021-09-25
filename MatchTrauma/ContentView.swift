//
//  ContentView.swift
//  MatchTrauma
//
//  Created by Duong Nguyen on 2021-09-24.
//

import SwiftUI

struct ContentView: View {
    var emojis: [String] = ["⛵️", "🚗", "🏍" , "🚂"]
    var body: some View {
        HStack{
            CardView(content: emojis[0])
            CardView(content: emojis[1])
            CardView(content: emojis[2])
            CardView(content: emojis[3])
        }
        .padding(.horizontal)
        .foregroundColor(.purple)
    }
}

struct CardView: View{
    @State var isFaceUp: Bool = true
    var content: String
    
    var body: some View{
        ZStack{
            let shape = RoundedRectangle(cornerRadius: 20)
            if isFaceUp{
                shape.stroke(lineWidth: 3)
                shape.fill().foregroundColor(.white)
                Text(content).font(.largeTitle)
            } else {
                RoundedRectangle(cornerRadius: 20)
                    .fill()
            }
        }
        .onTapGesture{
            isFaceUp = !isFaceUp
        }
    }
}







// Preview:
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.light)
        ContentView()
            .preferredColorScheme(.dark)
    }
}
