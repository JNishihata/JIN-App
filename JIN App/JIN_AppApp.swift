//
//  JIN_AppApp.swift
//  JIN App
//
//  Created by Jintaro Nishihata on 2025/02/28.
//

import SwiftUI



@main
struct JIN_AppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}


func formattedDate(_ date: Date) -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = "MM/dd HH:mm"
    return formatter.string(from: date)
}

func formattedTime(_ date: Date) -> String{
    let formatter = DateFormatter()
    formatter.dateFormat = "HH:mm"
    return formatter.string(from: date)
}

func formattedIsland(_ date: Date) -> String{
    let formatter = DateFormatter()
    formatter.dateFormat = "MM/dd\n HH:mm"
    return formatter.string(from: date)
}

public func hello(for date: Date) -> String {
    let nowHour = Calendar.current.component(.hour, from:Date())
    if(nowHour < 4){
        return "Welcome back"
    }
    else if(nowHour < 11){
        return "Good morning"
    }
    else if(nowHour < 18){
        return "Good afternoon"
    }
    else{
        return "Good evening"
    }
}
