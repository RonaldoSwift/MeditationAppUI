//
//  MeditationUiState.swift
//  MeditationAppUI
//
//  Created by Ronaldo Andre on 21/03/24.
//

import Foundation

enum MeditationUiState {
    case initial
    case loading
    case error(String)
    case success([CategoryMeditation])
}
