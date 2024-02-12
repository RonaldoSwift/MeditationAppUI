//
//  MeditationAppUIApp.swift
//  MeditationAppUI
//
//  Created by Ronaldo Andre on 1/02/24.
//

import SwiftUI

@main
struct MeditationAppUIApp: App {
    
    @StateObject private var appRootManager = AppRootManager()
    
    var body: some Scene {
        WindowGroup {
            Group {
                switch appRootManager.currentRoot {
                case .splash:
                    SplashRootView()
                case .authentication:
                    AuthenticationRootView()
                case .principal:
                    PrincipalRootView()
                }
            }
            .environmentObject(appRootManager)
        }
    }
}
