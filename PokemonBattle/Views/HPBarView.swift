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
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .frame(width: 150, height: 10)
                .foregroundColor(.black.opacity(0.1))
                .background()
            Rectangle()
                .cornerRadius(50, corners: [.topLeft,.bottomLeft])
                .frame(width: hpStatus.hpLevel, height: 10)
                .foregroundColor(hpStatus.hpColor)
                .animation(Animation.easeOut(duration: 1.0))
        }
    }
}

struct HPBarView_Previews: PreviewProvider {
    static var previews: some View {
        HPBarView(hpStatus: HPStatus())
    }
}
