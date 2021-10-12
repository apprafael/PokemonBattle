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
            MyPokemonView(pokemon:  myPokemon)
            HStack(spacing: 50) {
                Button("Attack") {
                    opponentPokemon.attacked(damage: Double.random(in: 1...50))
                    attackDisabled = true
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                        myPokemon.attacked(damage:  Double.random(in: 1...50))
                        attackDisabled = false
                    }
                }.disabled(attackDisabled)
                Button("retry") {
                    myPokemon = Pokemon(img: "pikachu",
                                      name: "Pikachu")
                    opponentPokemon = Pokemon(img: "bulbasaur",
                                        name: "Bulbasaur")
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
