//
//  Startmenu.swift
//  JIN App
//
//  Created by Jintaro Nishihata on 2025/03/28.
//

import SwiftUI
import EventKit
import ActivityKit



struct Startmenu: View{
    @Environment(\.colorScheme) var colorScheme
    @State var darkColor:Double = 0.17
    @State var lightColor:Double = 0.93
    @State var backColor = Color(red:0.00,green:0.00,blue:0.00)
    @State var nowtime = Date()
    @Environment(\.horizontalSizeClass) var sizeClass
    
    @StateObject private var calendarData = CalendarData.shared
    @State private var activityUpdateTimer: Timer?
    
    
    
    var body: some View{
        ScrollView{
            VStack(alignment: .leading){
                HStack{
                    VStack(alignment:.leading){
                        Text("\(hello(for: Date())),")
                            .font(.largeTitle)
                            .multilineTextAlignment(.leading)
                        Text("Jintaro")
                            .font(.largeTitle)
                            .multilineTextAlignment(.leading)
                    }
                }
                Text(Date(), style: .date)
                    .font(.headline)
                    .foregroundColor(.gray)
                calendarWidget(calendarData: calendarData)
            }.padding(.horizontal)
                .onAppear {                                                             //get calender authorization states and next event data
                    calendarData.requestCalAccess()
                    calendarData.checkAuthorizationStatus()
                    calendarData.fetchNextEvent()
                    if(colorScheme == .light){
                        backColor = Color(red:lightColor,green:lightColor,blue:lightColor)
                    }
                    else{
                        backColor = Color(red:darkColor,green:darkColor,blue:darkColor)
                    }
                }
                .navigationTitle("For You")
                .animation(.spring(response: 0.5, dampingFraction: 0.7), value: sizeClass)
        }
    }
}

struct calendarWidget: View{
    @Environment(\.colorScheme) var colorScheme
    @State var calendarData:CalendarData
    @State var darkColor:Double = 0.17
    @State var lightColor:Double = 0.93
    @State var backColor = Color(red:0.00,green:0.00,blue:0.00)
    var body: some View{
        if(calendarData.authorizationStatus == .fullAccess){
            HStack{
                Text("\nCalendar")
                    .font(.body)
                    .multilineTextAlignment(.leading)
                Spacer()
            }.padding(.horizontal) //calender title
            if let event = calendarData.nextEvent {                     //has calender some events?
                if event.isAllDay {                                     //if first event is all day event
                    VStack(alignment: .leading){
                        HStack{
                            Text("All Day Event")
                                .font(.title3)
                            Spacer()
                        }
                        Divider()
                        Text("\(event.title ?? "No Titled")")
                            .font(.title2)
                    }.padding()
                        .background(colorScheme == .light ? Color(red:lightColor, green:lightColor, blue:lightColor) : Color(red:darkColor,green:darkColor,blue:darkColor))
                        .cornerRadius(10)
                } else {                                                //if first event is normal event
                    VStack(alignment: .leading){
                        HStack{
                            
                            Text("Next Event")
                                .font(.title3)
                            
                            Spacer()
                        }
                        Divider()
                        Text("From: \(formattedDate(event.startDate))")
                        Text("\(event.title ?? "No Titled")")
                            .font(.title2)
                    }.padding()
                        .background(colorScheme == .light ? Color(red:lightColor, green:lightColor, blue:lightColor) : Color(red:darkColor,green:darkColor,blue:darkColor))
                        .cornerRadius(10)
                }
            }else {                                                    //if there is any event
                VStack(alignment: .leading){
                    Text("Event")
                        .padding()
                    Divider()
                    HStack{
                        Text("Your day is clear")
                        Spacer()
                    }
                    
                }
                .background(colorScheme == .light ? Color(red:lightColor, green:lightColor, blue:lightColor) : Color(red:darkColor,green:darkColor,blue:darkColor))
                .cornerRadius(10)
            }
            if let normalEvent = calendarData.nextNormalEvent {         //if first event is all day, second normal event is show here
                VStack(alignment: .leading){
                    HStack{
                        Text("Next Event")
                            .font(.title3)
                        Spacer()
                    }
                    Divider()
                    Text("From: \(formattedDate(normalEvent.startDate))")
                    Text("\(normalEvent.title ?? "No titled")")
                        .font(.title2)
                }.padding()
                    .background(colorScheme == .light ? Color(red:lightColor, green:lightColor, blue:lightColor) : Color(red:darkColor,green:darkColor,blue:darkColor))
                    .cornerRadius(10)
            }
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


struct Startmenu_Previews: PreviewProvider{
    static var previews: some View{
        Startmenu()
    }
}

