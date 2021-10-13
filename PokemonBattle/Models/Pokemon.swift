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
    var pokemonWidht: CGFloat = 100.0
    var progressPositon = 0.1
    var position: CGFloat = 150
    var hpStatus: HPStatus = HPStatus()
    
    mutating func attacked() {
        hpStatus.hited()
        if hpStatus.pokemonIsDefeated() {
            position = 1000.0
        }
    }
}

struct HPStatus {
    var attempts: Int = 0
    var hpLevel: CGFloat = 140.0
    var hpColor: Color = .green
    private var defeated = false
    
    mutating func hited() {
        hpLevel -= Double.random(in: 1...50)
        attempts += 1
        if hpLevel < 100 {  hpColor = .yellow   }
        if hpLevel < 50 {   hpColor = .red  }
        if hpLevel < 0 {
            defeated = true
            hpLevel = 0
            return }
    }
    
    func pokemonIsDefeated() -> Bool{
        return defeated
    }
}
