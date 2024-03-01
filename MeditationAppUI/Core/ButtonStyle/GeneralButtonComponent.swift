//
//  GeneralButtonComponent.swift
//  MeditationAppUI
//
//  Created by Ronaldo Andre on 5/02/24.
//

import Foundation
import SwiftUI

@ViewBuilder
func generalButtonComponent(onClickInSitioWeb: @escaping () -> Void, textoDelButton: String) -> some View {
    Button(action: {
        onClickInSitioWeb()
    }, label: {
        Text(textoDelButton)
            .frame(maxWidth: .infinity)
            .font(Fonts.HelveticaNeueCyr.medium.swiftUIFont(size: 14))
            .padding(.all, 20)
            .foregroundStyle(.primaryLabel)
            .background(Color.accentBackground2)
            .cornerRadius(40)

    })
}
