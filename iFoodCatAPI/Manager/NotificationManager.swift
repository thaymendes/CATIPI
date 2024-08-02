//
//  NotificationManager.swift
//  iFoodCatAPI
//
//  Created by Thayanne Mendes on 02/08/24.
//

import UserNotifications

class NotificationLocalManager {
    
    static func scheduleNotification(after seconds: TimeInterval) {
        let content = UNMutableNotificationContent()
        content.title = "CatAPI"
        content.body = "Confira as novas características diponíveis de gatos!"
        content.sound = .default
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: seconds, repeats: false)
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                Logger.shared.log("Erro ao agendar notificação: \(error.localizedDescription)", level: .error)
            } else {
                Logger.shared.log("Notificação agendada com sucesso", level: .info)
            }
        }
    }
}

