//
//  SignUpUiState.swift
//  MeditationAppUI
//
//  Created by Ronaldo Andre on 11/03/24.
//

import Foundation

enum SignUpUiState {
    case initial
    case loading
    case error(String)
    case success(User)
}
