//
//  HomeMeditation.swift
//  MeditationAppUI
//
//  Created by Ronaldo Andre on 24/03/24.
//

import Foundation

struct HomeMeditation: Codable, Identifiable {
    var id: String = UUID().uuidString
    let icon: String
    let mame: String
    let textMeditation: String
    let time: String
}
