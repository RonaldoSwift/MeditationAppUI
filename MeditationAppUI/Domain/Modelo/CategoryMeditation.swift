//
//  CategoryMeditation.swift
//  MeditationAppUI
//
//  Created by Ronaldo Andre on 21/03/24.
//

import Foundation

struct CategoryMeditation: Codable, Identifiable {
    var id: String = UUID().uuidString
    let name: String
    let icon: String
}
