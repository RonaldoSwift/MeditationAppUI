//
//  ProfileViewModel.swift
//  MeditationAppUI
//
//  Created by Ronaldo Andre on 26/03/24.
//

import Foundation

final class ProfileViewModel: ObservableObject {
    let authenticationRepository: AuthenticationRepository

    init(authenticationRepository: AuthenticationRepository) {
        self.authenticationRepository = authenticationRepository
    }

    func logout() {
        authenticationRepository.saveUserLoggedInCache(isLogged: false)
    }
}
