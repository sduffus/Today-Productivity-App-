//
//  EKReminder+Reminder.swift
//  Today
//
//  Created by Shaun Duffus on 2023-08-05.
//

import EventKit
import Foundation

extension EKReminder {
    func update(using reminder: Reminder, in store: EKEventStore) {
        title = reminder.title
        notes = reminder.notes
        isCompleted = reminder.isComplete
        calendar = store.defaultCalendarForNewReminders()
        alarms?.forEach { alarm in
             guard let absolureDate = alarm.absoluteDate else { return }
             let comparison = Locale.current.calendar.compare(
                reminder .dueDate, to: absolureDate, toGranularity: .minute)
            if comparison != .orderedSame {
                removeAlarm(alarm)
                
            }
        }
        if !hasAlarms {
            addAlarm(EKAlarm(absoluteDate: reminder.dueDate))
        }
    }
}
