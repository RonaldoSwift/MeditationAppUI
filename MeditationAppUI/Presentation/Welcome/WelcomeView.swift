//
//  WelcomeView.swift
//  MeditationAppUI
//
//  Created by Carlos Leonardo Camilo Vargas Huaman on 28/02/24.
//

import SwiftUI

struct WelcomeView: View {
    @EnvironmentObject private var appRootManager: AppRootManager

    var body: some View {
        #if DEBUG
            let isMessageDisabled = true
        #elseif QA
            let isMessageDisabled = false
        #elseif STORE
            let isMessageDisabled = false
        #endif

        ZStack {
            Color.accentBackground1
                .ignoresSafeArea()

            VStack {
                Spacer()
                Image(ImageResource.welcome)
            }

            VStack(alignment: .center) {
                SilentMoonLogoView(textColor: Color.primaryLabel, logoImageResource: ImageResource.logo)
                    .padding(.bottom, 40)

                Text("Hi Asfar, Welcome")
                    .font(Fonts.HelveticaNeueCyr.bold.swiftUIFont(size: 30))
                    .foregroundStyle(.accentLabel1)

                Text("to Silent Moon")
                    .font(Fonts.HelveticaNeueCyr.light.swiftUIFont(size: 30))
                    .padding(.vertical, 2)
                    .foregroundStyle(.accentLabel1)
                Text("Explore the app, Find some peace of mind to prepare for meditation.")
                    .font(Fonts.HelveticaNeueCyr.light.swiftUIFont(size: 16))
                    .padding(.all, 20)
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.accentLabel2)

                Spacer()

                PrimaryButton(
                    text: "GET STARTED",
                    textColor: Color.primaryLabel,
                    backgroundColor: Color.accentBackground2
                ) {
                    appRootManager.currentRoot = .authentication
                }
            }
            .padding(EdgeInsets(top: 5, leading: 30, bottom: 30, trailing: 30))

            if isMessageDisabled {
                Text("Este es un mensaje DEBUG")
            }
        }
    }
}

#if DEBUG
    struct WelcomeView_Previews: PreviewProvider {
        static var previews: some View {
            Preview {
                WelcomeView()
            }
        }
    }
#endif
