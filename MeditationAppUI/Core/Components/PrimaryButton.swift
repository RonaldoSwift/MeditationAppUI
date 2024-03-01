//
//  PrimaryButton.swift
//  MeditationAppUI
//
//  Created by Carlos Leonardo Camilo Vargas Huaman on 29/02/24.
//

import SwiftUI

struct PrimaryButton: View {
    var text: String
    var textColor: Color = Color.sharedAccentLabel
    var backgroundColor: Color = Color.sharedPrimaryFill
    var onClick: () -> Void

    var body: some View {
        Button(action: {
            onClick()
        }, label: {
            Text(text)
                .frame(maxWidth: .infinity)
                .font(Fonts.HelveticaNeueCyr.medium.swiftUIFont(size: 14))
                .padding(.all, 20)
                .foregroundStyle(textColor)
                .background(backgroundColor)
                .cornerRadius(40)

        })
    }
}

#if DEBUG
    struct PrimaryButton_Previews: PreviewProvider {
        static var previews: some View {
            Preview {
                PrimaryButton(text: "Demo") {}
            }
        }
    }
#endif
