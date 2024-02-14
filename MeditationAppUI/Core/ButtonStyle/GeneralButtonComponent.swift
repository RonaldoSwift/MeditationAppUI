//
//  GeneralButtonComponent.swift
//  MeditationAppUI
//
//  Created by Ronaldo Andre on 5/02/24.
//

import Foundation
import SwiftUI

func generalButtonComponent(onClickInSitioWeb: @escaping () -> Void, textoDelButton: String) -> some View {
    Button(action: {
        onClickInSitioWeb()
    }, label: {
        Text(textoDelButton)
            .padding(EdgeInsets(top: 20, leading: 120, bottom: 20, trailing: 120))
                    .foregroundColor(.white)
                    .background(Color.colorButton)
                    .cornerRadius(40)
    })
}
