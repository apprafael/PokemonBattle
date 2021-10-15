//
//  PokemonImage.swift
//  Pokemon Battle
//
//  Created by Cédric Bahirwe on 15/10/2021.
//

import SwiftUI

struct PokemonImage: View {
    private let pokemon: Pokemon
    
    init(of pokemon: Pokemon) {
        self.pokemon = pokemon
    }
    var body: some View {
        Image(pokemon.img)
            .resizable()
            .scaledToFit()
            .frame(width: pokemon.pokemonWidth, height: pokemon.pokemonWidth)
            .modifier(Shake(animatableData: CGFloat(pokemon.hpStatus.attempts)))
            .animation(.easeOut(duration: 1.0), value: pokemon.hpStatus.hpLevel)
    }
}


struct PokemonImage_Previews: PreviewProvider {
    static var previews: some View {
        PokemonImage(of: .pikachuExample)
            .previewLayout(.fixed(width: 200, height: 200))
    }
}
