//
//  ContentView.swift
//  hpbar
//
//  Created by Rafael Almeida on 10/10/21.
//

import SwiftUI

struct ContentView: View {
    @State var myPokemon: Pokemon
    @State var opponentPokemon: Pokemon
    @State private var attackDisabled = false
    
    init(myPokemon: Pokemon, opponentPokemon: Pokemon) {
        self.myPokemon = myPokemon
        self.opponentPokemon = opponentPokemon
    }
    
    var body: some View {
        VStack() {
            OpponentPokemonView(pokemon: opponentPokemon)
            MyPokemonView(pokemon: myPokemon)
            HStack(spacing: 50) {
                Button("Attack") {
                    opponentPokemon.attacked()
                    attackDisabled = true
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                        if opponentPokemon.hpStatus.pokemonIsDefeated() {
                            return
                        }
                        myPokemon.attacked()
                        if myPokemon.hpStatus.pokemonIsDefeated() {
                            return
                        }
                        attackDisabled = false
                    }
                }.disabled(attackDisabled)
                Button("Retry") {
                    myPokemon = Pokemon(img: "pikachu",
                                      name: "Pikachu")
                    opponentPokemon = Pokemon(img: "bulbasaur",
                                        name: "Bulbasaur")
                    attackDisabled = false
                }
            }
        }.frame(width: 300, height: 400)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(myPokemon: Pokemon(img: "pikachu",name: "Pikachu"),
                    opponentPokemon: Pokemon(img: "bulbasaur",name: "Bulbasaur"))
    }
}
