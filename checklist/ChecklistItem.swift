//
//  ChecklistItem.swift
//  checklist
//
//  Created by i.y.kozlov on 13/11/2018.
//  Copyright © 2018 i.y.kozlov. All rights reserved.
//

import Foundation
import UserNotifications

class CheckListItem : NSObject, Codable {
    var text = ""
    var checked = false
    var dueDate = Date()
    var shouldRemind = false
    var itemID: Int
    
    init(text: String = "", checked: Bool = false) {
        self.text = text
        self.checked = checked
        itemID = DataModel.nextChecklistItemID()
        super.init()
    }
    
    deinit {
        removeNotification()
    }
    
    func toggleChecked(){
        checked = !checked
    }
    
    func scheduleNotification() {
        removeNotification()
        if shouldRemind && dueDate > Date() {
            let content = UNMutableNotificationContent()
            content.title = "Reminder"
            content.body = text
            content.sound = UNNotificationSound.default
            
            let calendar = Calendar(identifier: .gregorian)
            let components = calendar.dateComponents([.day,.month,.hour,.minute], from: dueDate)
            
            let trigger = UNCalendarNotificationTrigger(dateMatching: components, repeats: false)
            
            let request = UNNotificationRequest(identifier: "\(itemID)", content: content, trigger: trigger)
            
            let center = UNUserNotificationCenter.current()
            center.add(request)
            
            print("Scheduled: \(request) for itemID: \(itemID)")
            
        }
    }
    
    func removeNotification() {
        let center = UNUserNotificationCenter.current()
        center.removePendingNotificationRequests(withIdentifiers: ["\(itemID)"])
    }
}
