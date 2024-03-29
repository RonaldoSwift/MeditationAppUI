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
        print(pasword)
        Auth.auth().signIn(withEmail: correo, password: pasword) { authDataResult, error in
            if let errorNoNulo = error {
                onError("\(errorNoNulo.localizedDescription)")
            } else {
                onSuccess(FireBaseUser(
                    displayName: authDataResult?.user.displayName,
                    email: authDataResult?.user.email
                )
                )
            }
        }
    }

    func signUp(email: String, pasword: String, onError: @escaping (String) -> Void, onSuccess: @escaping (FireBaseSignUp) -> Void) {
        Auth.auth().createUser(withEmail: email, password: pasword) { authDataResult, error in
            if let errorNoNulo = error {
                onError("\(errorNoNulo)")
            } else {
                onSuccess(FireBaseSignUp(
                    displayName: authDataResult?.user.displayName,
                    email: authDataResult?.user.email
                )
                )
            }
        }
    }
}
