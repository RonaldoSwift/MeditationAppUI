//
//  Injector.swift
//  MeditationAppUI
//
//  Created by Carlos Leonardo Camilo Vargas Huaman on 23/03/24.
//

import Foundation
import Swinject

enum Injector {
    static let container = Container()

    static func registerDependencies() {
        // Data
        container.register(KeychainManager.self) { _ in
            KeychainManager()
        }

        container.register(MemoriaLogin.self) { _ in
            MemoriaLogin()
        }

        container.register(FireBaseAuthDataSource.self) { _ in
            FireBaseAuthDataSource()
        }

        // Domain
        container.register(AuthenticationRepository.self) { (resolver: Resolver) in
            AuthenticationRepository(
                fireBaseAuthDataSource: resolver.resolve(FireBaseAuthDataSource.self)!,
                memoriaLogin: resolver.resolve(MemoriaLogin.self)!
            )
        }

        // ViewModels
        container.register(SignInViewModel.self) { (resolver: Resolver) in
            SignInViewModel(
                authenticationRepository: resolver.resolve(AuthenticationRepository.self)!
            )
        }

        container.register(SignUpViewModel.self) { (resolver: Resolver) in
            SignUpViewModel(
                authenticationRepository: resolver.resolve(AuthenticationRepository.self)!
            )
        }

        container.register(MeditationViewModel.self) { (_: Resolver) in
            MeditationViewModel()
        }

        container.register(HomeViewModel.self) { (_: Resolver) in
            HomeViewModel()
        }

        container.register(ProfileViewModel.self) { (resolver: Resolver) in
            ProfileViewModel(
                authenticationRepository: resolver.resolve(AuthenticationRepository.self)!
            )
        }

        container.register(WelcomeViewModel.self) { (resolver: Resolver) in
            WelcomeViewModel(
                authenticationRepository: resolver.resolve(AuthenticationRepository.self)!
            )
        }
    }
}
