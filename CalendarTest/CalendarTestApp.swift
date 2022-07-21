//
//  CalendarTestApp.swift
//  CalendarTest
//
//  Created by Jessika Gerhardsson on 2022-07-21.
//

import SwiftUI

@main
struct CalendarTestApp: App {
    var body: some Scene {
        WindowGroup {
            let dateHolder = DateHolder()
            ContentView()
            .environmentObject(dateHolder)
            
        }
    }
}
