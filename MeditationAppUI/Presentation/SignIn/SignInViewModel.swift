//
//  SignInViewModel.swift
//  MeditationAppUI
//
//  Created by Ronaldo Andre on 8/03/24.
//

import Combine
import Foundation

final class SignInViewModel: ObservableObject {
    let authenticationRepository: AuthenticationRepository

    @Published private(set) var signInState = SignInUiState.initial

    init(authenticationRepository: AuthenticationRepository) {
        self.authenticationRepository = authenticationRepository
    }

    func signIn(correo: String, pasword: String) {
        signInState = SignInUiState.loading

        authenticationRepository.signIn(
            correo: correo,
            pasword: pasword
        ) { errorMensaje in
            self.signInState = SignInUiState.error(errorMensaje)
        } onSuccess: { (user: User) in

            self.authenticationRepository.saveUserLoggedInCache(isLogged: true)

            self.signInState = SignInUiState.success(user)
        }
    }
}
