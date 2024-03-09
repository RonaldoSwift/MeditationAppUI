//
//  AuthenticationRepository.swift
//  MeditationAppUI
//
//  Created by Ronaldo Andre on 8/03/24.
//

import Foundation

class AuthenticationRepository {
    private var fireBaseAuthDataSource: FireBaseAuthDataSource

    init(fireBaseAuthDataSource: FireBaseAuthDataSource) {
        self.fireBaseAuthDataSource = fireBaseAuthDataSource
    }

    func signIn(correo: String, pasword: String, onError: @escaping (String) -> Void, onSuccess: @escaping (User) -> Void) {
        fireBaseAuthDataSource.sigIn(
            correo: correo,
            pasword: pasword,
            onError: onError
        ) { fireBaseUser in
            var user = User(
                name: fireBaseUser.displayName ?? "",
                email: fireBaseUser.email ?? ""
            )
            onSuccess(user)
        }
    }
}
