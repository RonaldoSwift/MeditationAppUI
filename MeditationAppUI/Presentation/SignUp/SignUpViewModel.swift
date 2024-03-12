//
//  SignUpViewModel.swift
//  MeditationAppUI
//
//  Created by Ronaldo Andre on 11/03/24.
//

import Combine
import Foundation

final class SignUpViewModel: ObservableObject {
    let authenticationRepository: AuthenticationRepository

    @Published private(set) var signUpState = SignUpUiState.initial

    init(authenticationRepository: AuthenticationRepository) {
        self.authenticationRepository = authenticationRepository
    }

    func signUp(email: String, password: String) {
        guard !email.isEmpty && !password.isEmpty else {
            signUpState = SignUpUiState.error("Error!!! email o pasword esta vacio")
            return
        }

        signUpState = SignUpUiState.loading
        authenticationRepository.signUp(
            email: email,
            pasword: password
        ) { errorDeMensaje in
            self.signUpState = SignUpUiState.error(errorDeMensaje)
        } onSuccess: { onSuccess in
            self.signUpState = SignUpUiState.success(onSuccess)
        }
    }
}
