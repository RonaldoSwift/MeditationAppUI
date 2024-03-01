//
//  SilentMoonLogoView.swift
//  MeditationAppUI
//
//  Created by Carlos Leonardo Camilo Vargas Huaman on 29/02/24.
//

import SwiftUI

struct SilentMoonLogoView: View {
    var textColor: Color
    var logoImageResource: Image

    var body: some View {
        HStack {
            Text("S i l e n t")
                .font(.custom("HelveticaNeueCyr-Medium", size: 16))
                .foregroundStyle(textColor)
            logoImageResource
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
                SilentMoonLogoView(textColor: Color.accentColor, logoImageResource: Image(ImageResource.logo))
            }
        }
    }
#endif
