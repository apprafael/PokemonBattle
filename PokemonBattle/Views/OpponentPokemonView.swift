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
        VStack(alignment: .leading, spacing: 5) {
            Text("\(pokemon.name)")
            Text("\(Int(pokemon.hpStatus.hpLevel))/150")
            HPBarView(hpStatus: pokemon.hpStatus)
        }
        Image(pokemon.img)
            .resizable()
                .scaledToFit()
                .frame(width: pokemon.pokemonWidth, height: pokemon.pokemonWidth)
                .modifier(Shake(animatableData: CGFloat(pokemon.hpStatus.attempts)))
                .animation(Animation.easeOut(duration: 1.0))
        }
        .position(x: pokemon.position, y: 100.0)
        .animation(Animation.easeOut(duration: 1.0))
    }
}


struct OpponentPokemon_Previews: PreviewProvider {
    static var previews: some View {
        OpponentPokemonView(pokemon: Pokemon(img: "bulbasaur",
                                             name: "Bubassaur"))
    }
}
