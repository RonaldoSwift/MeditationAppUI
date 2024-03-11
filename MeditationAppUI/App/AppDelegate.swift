//
//  AppDelegate.swift
//  MeditationAppUI
//
//  Created by Carlos Leonardo Camilo Vargas Huaman on 9/03/24.
//

import FirebaseCore
import Foundation

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_: UIApplication, didFinishLaunchingWithOptions _: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
}
