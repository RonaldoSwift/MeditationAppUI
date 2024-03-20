//
//  AuthenticationRepository.swift
//  MeditationAppUI
//
//  Created by Ronaldo Andre on 8/03/24.
//

import Foundation

class AuthenticationRepository {
    private var fireBaseAuthDataSource: FireBaseAuthDataSource

    private let memoriaLogin: MemoriaLogin

    init(fireBaseAuthDataSource: FireBaseAuthDataSource, memoriaLogin: MemoriaLogin) {
        self.fireBaseAuthDataSource = fireBaseAuthDataSource
        self.memoriaLogin = memoriaLogin
    }

    func saveUserLoggedInCache(isLogged: Bool) {
        memoriaLogin.setUserLogged(isLogged: isLogged)
    }

    func signIn(correo: String, pasword: String, onError: @escaping (String) -> Void, onSuccess: @escaping (User) -> Void) {
        fireBaseAuthDataSource.sigIn(
            correo: correo,
            pasword: pasword,
            onError: onError
        ) { fireBaseUser in
            let user = User(
                name: fireBaseUser.displayName ?? "",
                email: fireBaseUser.email ?? ""
            )
            onSuccess(user)
        }
    }

    func signUp(email: String, pasword: String, onError: @escaping (String) -> Void, onSuccess: @escaping (User) -> Void) {
        fireBaseAuthDataSource.signUp(
            email: email,
            pasword: pasword,
            onError: onError
        ) { fireBaseSignUp in
            let user = User(
                name: fireBaseSignUp.displayName ?? "",
                email: fireBaseSignUp.email ?? ""
            )
            onSuccess(user)
        }
    }
}
