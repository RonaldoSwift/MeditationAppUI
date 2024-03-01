//
//  SplashView.swift
//  MeditationAppUI
//
//  Created by Carlos Leonardo Camilo Vargas Huaman on 8/02/24.
//

import SwiftUI

struct SplashView: View {
    @EnvironmentObject private var appRootManager: AppRootManager

    var body: some View {
        ZStack {
            Color.colorButton.edgesIgnoringSafeArea(.all)
            VStack {
                Image("Logo")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 50, height: 50)
                Text("Silent Moon")
                    .font(.custom("HelveticaNeueCyr-Medium", size: 16))
                    .foregroundColor(Color.white)
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                withAnimation(.spring) {
                    appRootManager.currentRoot = .authentication
                }
            }
        }
    }
}

#if DEBUG
    struct SplashView_Previews: PreviewProvider {
        static var previews: some View {
            Preview {
                SplashView()
            }
        }
    }
#endif
