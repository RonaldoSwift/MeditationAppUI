//
//  SignInUiState.swift
//  MeditationAppUI
//
//  Created by Ronaldo Andre on 8/03/24.
//

import Foundation

enum SignInUiState {
    case initial
    case loading
    case error(String)
    case success(User)
}
