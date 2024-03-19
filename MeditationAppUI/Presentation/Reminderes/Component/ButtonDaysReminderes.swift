//
//  ButtonDaysReminderes.swift
//  MeditationAppUI
//
//  Created by Ronaldo Andre on 18/03/24.
//

import Foundation
import SwiftUI

@ViewBuilder
func buttonDaysReminderes(completion _: @escaping () -> Void, textoButton: String) -> some View {
    Button(action: {}, label: {
        Text(textoButton)
            .font(Fonts.HelveticaNeueCyr.light.swiftUIFont(size: 12))
    })
    .padding()
    .foregroundColor(Color.white)
    .background(Color.primaryLabel)
    .cornerRadius(40)
}
