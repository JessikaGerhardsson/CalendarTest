//
//  MonthStruct.swift
//  CalendarTest
//
//  Created by Jessika Gerhardsson on 2022-07-21.
//

import Foundation

struct MonthStruct {
    
    var monthType: MonthType
    var dayInt: Int
    
    func day() -> String {
        return String(dayInt)
    }
}

enum MonthType
{
    case Previous
    case Current
    case Next
}
