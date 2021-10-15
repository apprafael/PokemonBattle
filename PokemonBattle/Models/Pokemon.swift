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
    private(set) var pokemonWidth: CGFloat = 100.0
//    private(set) var progressPositon = 0.1
    private(set) var position: CGFloat = 150
    private(set) var hpStatus: HPStatus
    
    init(img: String,
         name: String,
         pokemonWidth: CGFloat = 100.0,
         position: CGFloat = 150,
         hpStatus: HPStatus = HPStatus()) {
        
        self.img = img
        self.name = name
        self.pokemonWidth = pokemonWidth
        self.position = position
        self.hpStatus = hpStatus
    }
    
    mutating func attacked() {
        hpStatus.hited()
        if hpStatus.pokemonIsDefeated() {
            position = 1000.0
        }
    }
}

struct HPStatus {
    private(set) var attempts: Int = 0
    private(set) var hpLevel: CGFloat = 150.0
    private(set) var hpColor: Color = .green
    private var defeated = false

    mutating func hited() {
        hpLevel -= Double.random(in: 1...50)
        attempts += 1
        if hpLevel < 100 {  hpColor = .yellow   }
        if hpLevel < 50 {   hpColor = .red  }
        if hpLevel < 1 {
            defeated = true
            hpLevel = 0
            return }
    }
    
    func pokemonIsDefeated() -> Bool{
        return defeated
    }
}
