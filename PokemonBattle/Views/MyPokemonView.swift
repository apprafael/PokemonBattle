//
//  MyPokemonView.swift
//  hpbar
//
//  Created by Rafael Almeida on 11/10/21.
//

import SwiftUI

struct MyPokemonView: View {
    var pokemon: Pokemon
    
    init(pokemon: Pokemon){
        self.pokemon = pokemon
    }
    var body: some View {
        HStack(alignment: .top) {
            PokemonImage(of: pokemon)
            PokemonStatsView(of: pokemon, isOpponent: false)
        }
        .position(x: pokemon.position, y: 100.0)
    }
}

struct MyPokemonView_Previews: PreviewProvider {
    static var previews: some View {
        MyPokemonView(pokemon: Pokemon(img: "pikachu", name: "Pikachu"))
            .previewLayout(.fixed(width: 300, height: 200))
    }
}
