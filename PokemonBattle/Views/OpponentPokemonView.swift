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
            Text("\(Int(pokemon.hpLevel))/150")
            ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .frame(width: 150, height: 10)
                .foregroundColor(.black.opacity(0.1))
                Rectangle()
                    .frame(width: pokemon.hpLevel, height: 10, alignment: .leading)
                    .cornerRadius(50, corners: [.topLeft,.bottomLeft])
                    .foregroundColor(pokemon.hpColor)
                    .animation(Animation.easeOut(duration: 1.0))
            }
        }
        
        Image(pokemon.img)
            .resizable()
                .scaledToFit()
                .frame(width: pokemon.pokemonWidht, height: pokemon.pokemonWidht)
                .modifier(Shake(animatableData: CGFloat(pokemon.attempts)))
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
