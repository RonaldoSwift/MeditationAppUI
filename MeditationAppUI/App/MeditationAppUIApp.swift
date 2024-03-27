//
//  MeditationAppUIApp.swift
//  MeditationAppUI
//
//  Created by Ronaldo Andre on 1/02/24.
//

import SwiftUI

@main
struct MeditationAppUIApp: App {
    // register app delegate for Firebase setup
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

    @StateObject private var appRootManager = AppRootManager()

    var memoriaLogin = MemoriaLogin()

    var body: some Scene {
        WindowGroup {
            Group {
                switch appRootManager.currentRoot {
                case .splash:
                    if memoriaLogin.getUserLogged() == true {
                        PrincipalRootView()
                    } else if memoriaLogin.getSplashVisto() == true {
                        AuthenticationRootView()
                    } else {
                        SplashRootView()
                    }
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
