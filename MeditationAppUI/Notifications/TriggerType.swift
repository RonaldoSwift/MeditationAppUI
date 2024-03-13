//
//  TriggerType.swift
//  MeditationAppUI
//
//  Created by Carlos Leonardo Camilo Vargas Huaman on 13/03/24.
//

import CoreLocation
import Foundation
import UserNotifications

enum TriggerType: String {
    case time, calendar, location

    var trigger: UNNotificationTrigger {
        switch self {
        case .time:
            return UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        case .calendar:
            let dateComponent = DateComponents(hour: 23, minute: 55, weekday: 4)
            return UNCalendarNotificationTrigger(dateMatching: dateComponent, repeats: false)
        case .location:
            let coordinate = CLLocationCoordinate2D(latitude: 40.0, longitude: 50.0)
            let region = CLCircularRegion(center: coordinate, radius: 100, identifier: UUID().uuidString)
            return UNLocationNotificationTrigger(region: region, repeats: true)
        }
    }
}
