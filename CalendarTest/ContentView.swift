//
//  ContentView.swift
//  CalendarTest
//
//  Created by Jessika Gerhardsson on 2022-07-21.
//


import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var dateHolder: DateHolder
    
    var dayOfWeekStack: some View
    {
        HStack(spacing: 1) {
        
          
            
            Text("Mån").dayOfWeek()
            Text("Tis").dayOfWeek()
            Text("Ons").dayOfWeek()
            Text("Tor").dayOfWeek()
            Text("Fre").dayOfWeek()
            Text("Lör").dayOfWeek()
            Text("Sön").dayOfWeek()
            
        }
    }
    
    var calendarGrid: some View
    {
        
        
        VStack(spacing: 1) {
            let daysInMonth = CalendarHelper().daysInMonth(dateHolder.date)
            let firstDayOfMonth = CalendarHelper().firstOfMonth(dateHolder.date)
            let startingSpaces = CalendarHelper().weekDay(firstDayOfMonth)
            let prevMonth = CalendarHelper().minusMonth(dateHolder.date)
            let daysInPrevMonth = CalendarHelper().daysInMonth(prevMonth)
            
            ForEach(0..<6) {
                row in
                HStack(spacing: 1) {
                    ForEach(1..<8) { column in
                        let count = column + (row * 7)
                        CalendarCell(count: count, startingSpaces: startingSpaces, daysInMonth: daysInMonth, daysInPrevMonth: daysInPrevMonth)
                            .environmentObject(dateHolder)
                    }
                }
            }
        }
        .frame(maxHeight: .infinity)
    }
    
    var body: some View {
        VStack(spacing: 1) {
            DateScrollerView()
                .environmentObject(dateHolder)
            .padding()
            dayOfWeekStack
            calendarGrid
        }
    }
}

extension Text {
    func dayOfWeek() -> some View {
        self.frame(maxWidth: .infinity)
            .padding(.top, 1)
            .lineLimit(1)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

