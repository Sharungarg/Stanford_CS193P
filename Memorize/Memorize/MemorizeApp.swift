//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Sharun Garg on 2022-03-21.
//

import SwiftUI

@main
struct MemorizeApp: App {
    var body: some Scene {
        WindowGroup {
            let game = EmojiMemoryGame()
            ContentView(viewModel: game)
        }
    }
}
