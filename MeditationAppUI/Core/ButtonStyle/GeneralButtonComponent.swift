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
            .padding(EdgeInsets(top: 20, leading: 130, bottom: 20, trailing: 130))
                    .foregroundColor(.white)
                    .background(Color.colorButton)
                    .cornerRadius(40)
    })
    .padding(.top, 100)
}
