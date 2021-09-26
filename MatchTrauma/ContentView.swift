//
//  ContentView.swift
//  MatchTrauma
//
//  Created by Duong Nguyen on 2021-09-24.
//

import SwiftUI

struct ContentView: View {
    var emojis: [String] = ["⛵️", "🚗", "🏍" , "🚂", "🚲", "🚕", "🚙", "🚌", "🚎", "🛴", "🛵", "🛺", "🚔" ]
    @State var emojiCount = 6
    
    var body: some View {
        VStack{
            HStack{
                ForEach(emojis[0..<emojiCount], id: \.self) { emojis in
                    CardView(content: emojis)
                    }
                }
            HStack{
                add
                Spacer()
                remove
            }
            .padding(.horizontal)
            }
            .padding(.horizontal)
            .foregroundColor(.purple)
        }
    
    
        // Add Card button:
        var add: some View {
            Button(action: {
                emojiCount += 1
            }, label:{
                    VStack{
                        Text("Add")
                        Text("Card")
                    }
                })
        }
        // Remove Card button:
        var remove: some View {
        Button(action: {
            emojiCount -= 1
        }, label:{
                VStack{
                    Text("Remove")
                    Text("Card")
                }
            })
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
}
