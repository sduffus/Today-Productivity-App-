//
//  Date+Today.swift
//  Today
//
//  Created by Shaun Duffus on 2023-06-07.
//

import Foundation

extension Date {
    var dayAndTimeText: String {
        let timeText = formatted(date: .omitted, time: .shortened)
        if Locale.current.calendar.isDateInToday(self) {
            let timeFormet = NSLocalizedString("Today at %@", comment: "Today at time format string")
            return String(format: timeFormet, timeText)
        } else {
            let dateText = formatted(.dateTime.month(.abbreviated).day())
            let dateAndTimeFormat = NSLocalizedString("%@ at %@", comment: "DAte and time format string")
            return String(format: dateAndTimeFormat, dateText, timeText)
        }
    }
    var dayText: String {
        if Locale.current.calendar.isDateInToday(self) {
            return NSLocalizedString("Today", comment: "Today due date description")
        } else {
            return formatted(.dateTime.month().day().weekday(.wide))
        }
    }
}
