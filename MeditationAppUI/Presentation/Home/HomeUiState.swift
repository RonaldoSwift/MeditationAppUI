//
//  HomeUiState.swift
//  MeditationAppUI
//
//  Created by Ronaldo Andre on 24/03/24.
//

import Foundation

enum HomeUiState {
    case initial
    case loading
    case error(String)
    case success([HomeMeditation])
}
