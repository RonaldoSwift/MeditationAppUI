//
//  NotificationManager.swift
//  MeditationAppUI
//
//  Created by Carlos Leonardo Camilo Vargas Huaman on 12/03/24.
//

import Foundation
import UIKit
import UserNotifications

class NotificationManager {
    static let shared = NotificationManager()

    func requestPermissionForLocalNotification() {
        // 1. Request permission to display alerts and play sounds.
        let options: UNAuthorizationOptions = [.alert, .sound, .badge]
        UNUserNotificationCenter.current().requestAuthorization(options: options) { (granted: Bool, error: Error?) in
            if granted {
                print("Permission granted")
            } else if let error = error {
                print(error.localizedDescription)
            }
        }
    }

    func scheduleNotification(triggerType: TriggerType) {
        let content = UNMutableNotificationContent()
        content.title = "Local Notification!"
        content.body = "This is my first ever location Notification implemetation in SwiftUI"
        content.sound = .default
        content.badge = 1

        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: triggerType.trigger)
        UNUserNotificationCenter.current().add(request)
    }

    func scheduleNotification() {
        // 2. Create the content for the notification
        let content = UNMutableNotificationContent()
        content.title = "Reminder"
        content.body = "Don't forget to check your tasks!"
        content.sound = UNNotificationSound.default

        // 3. Set up a trigger for the notification
        // For example, 60 seconds from now
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 60, repeats: false)

        // 4. Create the request
        let request = UNNotificationRequest(identifier: "reminderNotification", content: content, trigger: trigger)

        // 5. Add the request to the notification center
        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                print("Error scheduling notification: \(error.localizedDescription)")
            } else {
                print("Notification scheduled successfully")
            }
        }
    }

    func scheduleNotificationWithActions(triggerType: TriggerType) {
        // Content
        let content = UNMutableNotificationContent()
        content.title = "Meeting Reminder"
        content.body = "Your meeting starts in 10 minutes!"
        content.sound = UNNotificationSound.default

        // Actions
        let action1 = UNNotificationAction(identifier: "snoozeAction", title: "Snooze", options: [])
        let action2 = UNNotificationAction(identifier: "cancelAction", title: "Cancel", options: [.destructive])

        // Category
        let category = UNNotificationCategory(identifier: "meetingCategory", actions: [action1, action2], intentIdentifiers: [], options: [])
        UNUserNotificationCenter.current().setNotificationCategories([category])
        content.categoryIdentifier = "meetingCategory"

        // Request
        let request = UNNotificationRequest(identifier: "meetingNotification", content: content, trigger: triggerType.trigger)
        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                print("Error scheduling notification: \(error.localizedDescription)")
            } else {
                print("Notification with actions scheduled successfully")
            }
        }
    }

    func scheduleNotificationWithIconsAndActions() {
        // Content
        let content = UNMutableNotificationContent()
        content.title = "Meeting Reminder"
        content.body = "Your meeting starts in 10 minutes!"
        content.sound = UNNotificationSound.default

        // Actions
        let likeActionIcon = UNNotificationActionIcon(systemImageName: "hand.thumbsup")
        let likeAction = UNNotificationAction(
            identifier: "new_comment_category.like_action",
            title: "Like",
            options: UNNotificationActionOptions.foreground,
            icon: likeActionIcon
        )
        let dislikeActionIcon = UNNotificationActionIcon(systemImageName: "hand.thumbsdown")
        let dislikeAction = UNNotificationAction(
            identifier: "new_comment_category.dislike_action",
            title: "Dislike",
            options: UNNotificationActionOptions.foreground,
            icon: dislikeActionIcon
        )

        // Category
        let newCommentCategory = UNNotificationCategory(identifier: "new_comment_category", actions: [likeAction, dislikeAction], intentIdentifiers: [])
        let notificationCenter = UNUserNotificationCenter.current()
        notificationCenter.setNotificationCategories([newCommentCategory])
        content.categoryIdentifier = "new_comment_category"

        // Trigger
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 10, repeats: false)

        // Request
        let request = UNNotificationRequest(identifier: "meetingNotification", content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                print("Error scheduling notification: \(error.localizedDescription)")
            } else {
                print("Notification with actions scheduled successfully")
            }
        }
    }

    func scheduleNotificationWithImagesAndActions() {
        // Content
        let content = UNMutableNotificationContent()
        content.title = "Meeting Reminder"
        content.body = "Your meeting starts in 10 minutes!"
        content.sound = UNNotificationSound.default

        // Attachment (remember: images can live in assets catalog or bundle)
        let url = Bundle.main.url(forResource: "ronaldo", withExtension: "jpeg")
        let imageData = NSData(contentsOf: url!)
        guard let attachment = UNNotificationAttachment.create(imageFileIdentifier: "ronaldo.jpeg", data: imageData!, options: nil) else { return }
        content.attachments = [attachment]

        // Actions
        let action1 = UNNotificationAction(identifier: "snoozeAction", title: "Snooze", options: [])
        let action2 = UNNotificationAction(identifier: "cancelAction", title: "Cancel", options: [])

        // Category
        let category = UNNotificationCategory(identifier: "general", actions: [action1, action2], intentIdentifiers: [], options: [.customDismissAction])
        UNUserNotificationCenter.current().setNotificationCategories([category])
        content.categoryIdentifier = "general"

        // Trigger
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 10, repeats: false)

        // Request
        let request = UNNotificationRequest(identifier: "meetingNotification", content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                print("Error scheduling notification: \(error.localizedDescription)")
            } else {
                print("Notification with actions scheduled successfully")
            }
        }
    }

    func removeAllNotifications() {
        UNUserNotificationCenter.current().removeAllDeliveredNotifications()
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
    }
}
