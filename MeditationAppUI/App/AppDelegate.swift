//
//  AppDelegate.swift
//  MeditationAppUI
//
//  Created by Carlos Leonardo Camilo Vargas Huaman on 9/03/24.
//

import FirebaseCore
import Foundation
import UserNotifications

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_: UIApplication, didFinishLaunchingWithOptions _: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        // Firebase
        FirebaseApp.configure()

        // Local Notifications
        UNUserNotificationCenter.current().delegate = self
        NotificationManager.shared.requestPermissionForLocalNotification()
        return true
    }
}
