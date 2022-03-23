//
//  ContentView.swift
//  Memorize
//
//  Created by Sharun Garg on 2022-03-21.
//

import SwiftUI

struct ContentView: View {
    @State var emojis: [String] = ["⚽️","🏀","🏈","⚾️","🥎","🎾","🏐","🏉","🥏","🎱", "🥋","🎽","🛼","🥌","🥊","⛳️","🎭","🎨","🎮","🎳"]
    var body: some View {
        VStack{
            Text("Memorize!").font(.largeTitle)
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    ForEach(emojis[0..<emojis.count], id: \.self) { emoji in
                        CardView(content: emoji)
                            .aspectRatio(3/4, contentMode: .fit)
                    }
                }
            }
            Spacer()
            HStack {
                sportsTheme
                Spacer()
                vehiclesTheme
                Spacer()
                musicTheme
            }.padding(.horizontal)
        }
        .padding()
    }
    
    var sportsTheme: some View {
        Button {
            emojis = ["⚽️","🏀","🏈","⚾️","🥎","🎾","🏐","🏉","🥏","🎱", "🥋","🎽","🛼","🥌","🥊","⛳️","🎭","🎨","🎮","🎳"].shuffled()
        } label: {
            VStack{
                Image(systemName: "sportscourt.fill").font(.largeTitle)
                Text("Sports")
            }
        }
    }
    
    var vehiclesTheme: some View{
        Button {
            emojis = ["🚗","🚕", "🚙","🚌","🚑","🚐","🚚","🚛","🚜","🚘","🚝","🚁","✈️","🛫","🛬","🛩️"].shuffled()
        } label: {
            VStack {
                Image(systemName: "car.2.fill").font(.largeTitle)
                Text("Vehicles")
            }
        }
    }
    
    var musicTheme: some View {
        Button {
            emojis = ["🥁","🎷","🎺","🪗","🎸","🪕","🎻","🎙️","🎚️","🎛️","🎵","🎹","🎤","🔊"].shuffled()
        } label: {
            VStack{
                Image(systemName: "music.note").font(.largeTitle)
                Text("Music")
            }
        }
    }
}

struct ThemeButton: View {
    var image: String
    var label: String
    var body: some View {
        Button {} label: {
            VStack{
                Image(systemName: image).font(.largeTitle)
                Text(label)
            }
        }
    }
}

struct CardView: View {
    @State var isCardUp: Bool = true
    var content: String
    var body: some View {
        ZStack {
            let card = RoundedRectangle(cornerRadius: 20)
            if isCardUp {
                card.fill(.white)
                card.strokeBorder(lineWidth: 4)
                Text(content)
                    .font(.largeTitle)
            } else {
                card.fill(.red)
            }
        }
        .foregroundColor(.red)
        .onTapGesture {
            isCardUp = !isCardUp
        }
    }
}























struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.light)
        ContentView()
            .preferredColorScheme(.dark)
    }
}
