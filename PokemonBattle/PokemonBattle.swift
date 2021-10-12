//
//  hpbarApp.swift
//  hpbar
//
//  Created by Rafael Almeida on 10/10/21.
//

import SwiftUI

@main
struct PokemonBattle: App {
    var body: some Scene {
        WindowGroup {
            ContentView(myPokemon: Pokemon(img: "pikachu",name: "Pikachu"),
                        opponentPokemon: Pokemon(img: "bulbasaur",name: "Bulbasaur"))
        }
    }
}
