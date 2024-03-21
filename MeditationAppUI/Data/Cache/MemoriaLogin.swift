//
//  MemoriaLogin.swift
//  MeditationAppUI
//
//  Created by Ronaldo Andre on 19/03/24.
//

import Foundation

class MemoriaLogin {
    private let userLoginKey = "USER_LOGIN_KEY"

    func setUserLogged(isLogged: Bool) {
        UserDefaults.standard.set(isLogged, forKey: userLoginKey)
    }

    func getUserLogged() -> Bool {
        UserDefaults.standard.bool(forKey: userLoginKey)
    }
}
