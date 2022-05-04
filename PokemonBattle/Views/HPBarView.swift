//
//  HPBarView.swift
//  Pokemon Battle
//
//  Created by Rafael Almeida on 12/10/21.
//

import SwiftUI

struct HPBarView: View {
    var hpStatus: HPStatus
    
    init(hpStatus: HPStatus) {
        self.hpStatus = hpStatus
    }
    
    var body: some View {
        HStack {
            Rectangle()
                .frame(width: hpStatus.hpLevel, height: 10)
                .foregroundColor(hpStatus.hpColor)
                .animation(Animation.easeOut(duration: 1.0), value: hpStatus.hpLevel)
                .mask(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 20, style: .circular)
                        .frame(width: 150, height: 10)
                        .clipped()
                }
                .background(
                    RoundedRectangle(cornerRadius: 20, style: .circular)
                        .frame(width: 150, height: 10)
                        .foregroundColor(.gray.opacity(0.2))
                    , alignment: .leading)
                
        }
        .frame(width: 150, height: 10, alignment: .leading)
    }
}

struct HPBarView_Previews: PreviewProvider {
    static var previews: some View {
        HPBarView(hpStatus: HPStatus())
            .previewLayout(.fixed(width: 250, height: 100))
    }
}
