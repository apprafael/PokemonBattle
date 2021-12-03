//
//  OpponentPokemon.swift
//  hpbar
//
//  Created by Rafael Almeida on 11/10/21.
//

import SwiftUI

struct OpponentPokemonView: View {
    var pokemon: Pokemon
    
    init(pokemon: Pokemon){
        self.pokemon = pokemon
    }
    var body: some View {
        HStack(alignment: .top) {
            PokemonStatsView(of: pokemon, isOpponent: true)
            PokemonImage(of: pokemon)
        }
        .animation(.easeOut(duration: 1.0))
        .position(x: pokemon.position, y: 100.0)
    }
}


struct OpponentPokemon_Previews: PreviewProvider {
    static var previews: some View {
        OpponentPokemonView(pokemon: Pokemon(img: "bulbasaur",
                                             name: "Bubassaur"))
    }
}
