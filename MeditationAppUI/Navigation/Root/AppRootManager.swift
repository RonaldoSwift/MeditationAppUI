//
//  AppRootManager.swift
//  MeditationAppUI
//
//  Created by Carlos Leonardo Camilo Vargas Huaman on 8/02/24.
//

import Foundation

final class AppRootManager: ObservableObject {
    
    @Published var currentRoot: AppRoots = .splash
    
    enum AppRoots {
        case splash
        case authentication
        case principal
    }
    
}
