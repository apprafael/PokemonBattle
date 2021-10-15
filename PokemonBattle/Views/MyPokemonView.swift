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
            Image(pokemon.img)
                .resizable()
                .scaledToFit()
                .frame(width: pokemon.pokemonWidth, height: pokemon.pokemonWidth)
                .modifier(Shake(animatableData: CGFloat(pokemon.hpStatus.attempts)))
                .animation(.easeOut(duration: 1.0), value: pokemon.hpStatus.hpLevel)
            VStack(alignment: .trailing, spacing: 5) {
                Text(pokemon.name)
                Text("\(Int(pokemon.hpStatus.hpLevel))/150")
                HPBarView(hpStatus: pokemon.hpStatus)
            }
        }
        .position(x: pokemon.position, y: 100.0)
    }
}

struct MyPokemonView_Previews: PreviewProvider {
    static var previews: some View {
        MyPokemonView(pokemon: Pokemon(img: "pikachu", name: "Pikachu"))
    }
}


