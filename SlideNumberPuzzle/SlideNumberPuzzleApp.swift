//
//  SlideNumberPuzzleApp.swift
//  SlideNumberPuzzle
//
//  Created by Nutchapon Kitkram on 20/11/2566 BE.
//

import SwiftUI

@main
struct SlideNumberApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(gameModel: GameModel())
        }
    }
}

