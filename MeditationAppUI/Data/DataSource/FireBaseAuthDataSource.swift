//
//  FireBaseAuthDataSource.swift
//  MeditationAppUI
//
//  Created by Ronaldo Andre on 8/03/24.
//

import FirebaseAuth
import Foundation

class FireBaseAuthDataSource {
    func sigIn(correo: String, pasword: String, onError: @escaping (String) -> Void, onSuccess: @escaping (FireBaseUser) -> Void) {
        Auth.auth().signIn(withEmail: correo, password: pasword) { authDataResult, error in
            if let errorNoNulo = error {
                onError("\(errorNoNulo)")
            } else {
                onSuccess(FireBaseUser(
                    displayName: authDataResult?.user.displayName,
                    email: authDataResult?.user.email
                )
                )
            }
        }
    }
}
