//
//  CalendarHelper.swift
//  CalendarTest
//
//  Created by Jessika Gerhardsson on 2022-07-21.
//

import Foundation
import SwiftUI


class CalendarHelper {
    
    var calendar = Calendar.current
    
    //calendar.firstWeekday = 2
    let dateFormatter = DateFormatter()
    
    func monthYearString(_ date: Date) -> String  {
        dateFormatter.dateFormat = "LLL yyy"
        return dateFormatter.string(from: date)
    }
    
    func plusMonth(_ date: Date) -> Date {
        return calendar.date(byAdding: .month, value: 1, to: date)!
    }
    
    func minusMonth(_ date: Date) -> Date {
        return calendar.date(byAdding: .month, value: -1, to: date)!
    }
    
    func daysInMonth(_ date: Date) -> Int {
        let range = calendar.range(of: .day, in: .month, for: date)!
        return range.count
    }
    
    func dayOfMonth(_ date: Date) -> Int {
        let components = calendar.dateComponents([.day], from: date)
        return components.day!
    }
    
    func firstOfMonth(_ date: Date) -> Date {
        
        let components = calendar.dateComponents([.year, .month], from: date)
        return calendar.date(from: components)!
    }
    
    func hourFromDate(date: Date) -> Int {
        let components = calendar.dateComponents([.hour], from: date)
        return components.hour!
    }
    
    //Input: 15 Jan 2021 -> Result: January
    func monthString(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "LLLL"
        return dateFormatter.string(from: date)
    }
    
    //Veckodagen för daily calendar
    func monthDayString(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "LLLL dd"
        return dateFormatter.string(from: date)
    }
    
    //Input: 15 Jan 2021 -> Result: 2021
    func yearString(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy"
        return dateFormatter.string(from: date)
    }
    
    func timeString(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        return dateFormatter.string(from: date)
    }
    
    //Returnar veckodagen till daily calendar
    func weekDayAsString(date: Date) -> String {
        switch weekDay(date) {
        case 0:
            return "Måndag"
        case 1:
            return "Tisdag"
        case 2:
            return "Onsdag"
        case 3:
            return "Torsdag"
        case 4:
            return "Fredag"
        case 5:
            return "Lördag"
        case 6:
            return "Söndag"
        default:
            return ""
        }
    }
    
    func addDays(date: Date, days: Int) -> Date {
        return calendar.date(byAdding: .day, value: days, to: date)!
    }
    
    func sundayForDate(date: Date) -> Date {
        var current = date
        let oneWeekAgo = addDays(date: current, days: -7)
        
        while(current > oneWeekAgo) {
            let currentWeekDay = calendar.dateComponents([.weekday], from: current).weekday
            if currentWeekDay == 1 {
                return current
            }
            current = addDays(date: current, days: -2)
        }
        return current
        
        
        
    }
    
    //MARK: Ändra här
    func weekDay(_ date: Date) -> Int {
        let components = calendar.dateComponents([.weekday], from: date)
        return components.weekday! - 2
    }
    
}

