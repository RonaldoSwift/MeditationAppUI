//
//  MemoriaLogin.swift
//  MeditationAppUI
//
//  Created by Ronaldo Andre on 19/03/24.
//

import Foundation

class MemoriaLogin {
    private let userLoginKey = "USER_LOGIN_KEY"
    private let splashVistoKey = "SPLASH_VISTO_KEY"

    func setUserLogged(isLogged: Bool) {
        UserDefaults.standard.set(isLogged, forKey: userLoginKey)
    }

    func getUserLogged() -> Bool {
        UserDefaults.standard.bool(forKey: userLoginKey)
    }

    func setSplashVisto(visto: Bool) {
        UserDefaults.standard.set(visto, forKey: splashVistoKey)
    }

    func getSplashVisto() -> Bool {
        UserDefaults.standard.bool(forKey: splashVistoKey)
    }
}
