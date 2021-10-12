//
//  Pokemon.swift
//  hpbar
//
//  Created by Rafael Almeida on 11/10/21.
//

import SwiftUI

struct Pokemon {
    let img: String
    let name: String
    var hpLevel: CGFloat = 140.0
    var hpColor: Color = .green
    var pokemonWidht: CGFloat = 100.0
    var attempts: Int = 0
    var progressPositon = 0.1
    var position: CGFloat = 150
    
    mutating func attacked(damage: CGFloat) {
        hpLevel -= damage
        attempts += 1
        if hpLevel < 100 {  hpColor = .yellow   }
        if hpLevel < 50 {   hpColor = .red  }
        if hpLevel < 0 {
            position = 1000.0
            hpLevel = 0
            return }
    }
}
