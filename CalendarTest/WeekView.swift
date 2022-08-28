//
//  WeekView.swift
//  CalendarTest
//
//  Created by Jessika Gerhardsson on 2022-08-02.
//

import SwiftUI

struct WeekView: View {
    
    @EnvironmentObject var dateHolder: DateHolder
    @State var selectedDate = Date()
    @State var totalSquares = [Date]()
    
    
    var body: some View {
        VStack {
            HStack {
                Button {
                    prevWeek()
                } label: {
                    Image(systemName: "arrowshape.turn.up.backward")
                }
                Text("Vecka")
                Button {
                    nextWeek()
                } label: {
                    Image(systemName: "arrowshape.turn.up.right")
                }
            }
            
            
            ForEach(totalSquares, id:\.self) { row in
                List {
                    Text("Måndag \(totalSquares[0])")
                     Text("Tisdag \(totalSquares[1])")
                     Text("Onsdag \(totalSquares[2])")
                     Text("Torsdag \(totalSquares[3])")
                     Text("Fredag \(totalSquares[4])")
                     Text("Lördag \(totalSquares[5])")
                     Text("Söndag \(totalSquares[6])")
                }
                
            }

           // Text("Måndag \(totalSquares[0])")
//            Text("Tisdag \(totalSquares[1])")
//            Text("Onsdag \(totalSquares[2])")
//            Text("Torsdag \(totalSquares[3])")
//            Text("Fredag \(totalSquares[4])")
//            Text("Lördag \(totalSquares[5])")
//            Text("Söndag \(totalSquares[6])")
            
        }
        .onAppear {
            setWeek()
            print(totalSquares[0])
        }
        
    }
    
    func nextWeek() {
        selectedDate = CalendarHelper().addDays(date: selectedDate, days: -7)
        setWeek()
        
    }
    
    func prevWeek() {
        selectedDate = CalendarHelper().addDays(date: selectedDate, days: 7)
        setWeek()
    }
    
    func setWeek() {
        totalSquares.removeAll()
        var current = CalendarHelper().sundayForDate(date: selectedDate)
        let nextSunday = CalendarHelper().addDays(date: current, days: 7)
        while ( current < nextSunday) {
            totalSquares.append(current)
            current = CalendarHelper().addDays(date: current, days: 1)
        }
        print(totalSquares)
    }
}

struct WeekView_Previews: PreviewProvider {
    static var previews: some View {
        WeekView()
    }
}
