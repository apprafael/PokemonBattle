//
//  PokemonStatsView.swift
//  Pokemon Battle
//
//  Created by Cédric Bahirwe on 15/10/2021.
//

import SwiftUI

struct PokemonStatsView: View {
    private let pokemon: Pokemon
    private let isOpponent: Bool
    init(of pokemon: Pokemon, isOpponent: Bool) {
        self.pokemon = pokemon
        self.isOpponent = isOpponent
    }
    
    var body: some View {
        VStack(alignment: isOpponent ? .leading : .trailing, spacing: 5) {
            Text(pokemon.name)
            Text("\(Int(pokemon.hpStatus.hpLevel))/150")
            HPBarView(hpStatus: pokemon.hpStatus)
        }
    }
}


struct PokemonStatsView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonStatsView(of: .pikachuExample, isOpponent: false)
            .previewLayout(.fixed(width: 200, height: 200))
    }
}
