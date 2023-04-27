//
//  NotificationManager.swift
//  Unity
//
//  Created by Samuel Kosasih on 4/25/23.
//

import UserNotifications

struct NotificationManager {
    let notificationCenter = UNUserNotificationCenter.current()

    func requestAuthorization() {
        notificationCenter.requestAuthorization(options: [.alert, .badge, .sound]) { granted, error in
            if let error = error {
                print("Error requesting authorization for notifications: \(error.localizedDescription)")
            } else if granted {
                print("Authorization for notifications granted")
            } else {
                print("Authorization for notifications not granted")
            }
        }
    }

    func scheduleDailyNotification() {
        let morning_content = UNMutableNotificationContent()
        morning_content.title = "Daily Reminder"
        morning_content.body = "Don't forget to take a walk today!"
        morning_content.sound = UNNotificationSound.default
        let night_content = UNMutableNotificationContent()
        night_content.title = "Daily Reminder"
        night_content.body = "Don't forget to take a walk tomorrow!"
        night_content.sound = UNNotificationSound.default
 
        var night_date = DateComponents()
        night_date.hour = 20
        night_date.minute = 0
        var morning_date = DateComponents()
        morning_date.hour = 8
        morning_date.minute = 0
        let morning_trigger = UNCalendarNotificationTrigger(dateMatching: morning_date, repeats: true)
        let night_trigger = UNCalendarNotificationTrigger(dateMatching: night_date, repeats: true)

        let request_morning = UNNotificationRequest(identifier: UUID().uuidString, content: morning_content, trigger: morning_trigger)
        let request_night = UNNotificationRequest(identifier: UUID().uuidString, content: night_content, trigger: night_trigger)
        notificationCenter.add(request_night)
        notificationCenter.add(request_morning)
    }
}
