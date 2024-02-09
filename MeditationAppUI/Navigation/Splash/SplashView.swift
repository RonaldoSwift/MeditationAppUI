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
        Text("SPLASH")
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    withAnimation(.spring) {
                        appRootManager.currentRoot = .authentication
                    }
                }
            }
    }
}

#Preview {
    SplashView()
}
