//
//  SilentMoonLogoView.swift
//  MeditationAppUI
//
//  Created by Carlos Leonardo Camilo Vargas Huaman on 29/02/24.
//

import SwiftUI

struct SilentMoonLogoView: View {
    var textColor: Color
    var logoImageResource: ImageResource

    var body: some View {
        HStack {
            Text("S i l e n t")
                .font(.custom("HelveticaNeueCyr-Medium", size: 16))
                .foregroundStyle(textColor)
            Image(logoImageResource)
            Text("M o o n")
                .font(.custom("HelveticaNeueCyr-Medium", size: 16))
                .foregroundStyle(textColor)
        }
    }
}

#if DEBUG
    struct SilentMoonLogoView_Previews: PreviewProvider {
        static var previews: some View {
            Preview {
                SilentMoonLogoView(textColor: Color.accentColor, logoImageResource: ImageResource.logo)
            }
        }
    }
#endif
