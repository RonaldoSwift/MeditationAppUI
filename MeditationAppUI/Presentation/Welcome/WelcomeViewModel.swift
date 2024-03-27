//
//  WelcomeViewModel.swift
//  MeditationAppUI
//
//  Created by Ronaldo Andre on 26/03/24.
//

import Foundation

final class WelcomeViewModel: ObservableObject {
    let authenticationRepository: AuthenticationRepository

    init(authenticationRepository: AuthenticationRepository) {
        self.authenticationRepository = authenticationRepository
    }

    func setSplashVisto(visto: Bool) {
        authenticationRepository.setSplashVisto(visto: visto)
    }
}
