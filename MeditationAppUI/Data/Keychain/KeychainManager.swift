//
//  KeychainManager.swift
//  MeditationAppUI
//
//  Created by Carlos Leonardo Camilo Vargas Huaman on 25/03/24.
//

import Foundation
import KeychainAccess

class KeychainManager {
    let USER_EMAIL_KEY = "USER_EMAIL_KEY"
    let keychain = Keychain(service: "com.ronaldo.MeditationAppUI") // Bundle Identifier

    func setUserEmail(email: String) {
        do {
            try keychain.set(email, key: USER_EMAIL_KEY)
        } catch {
            print(error)
        }
    }

    func getUserEmail() -> String? {
        let userEmail = try? keychain.get(USER_EMAIL_KEY)
        return userEmail
    }

    func removeUserEmail() {
        do {
            try keychain.remove(USER_EMAIL_KEY)
        } catch {
            print("error \(error)")
        }
    }
}
