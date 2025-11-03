//
//  JinWidget.swift
//  JinWidget
//
//  Created by Jintaro Nishihata on 2025/03/30.
//

import WidgetKit
import SwiftUI
import EventKit

struct Provider: AppIntentTimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), configuration: ConfigurationAppIntent(), nextEventTitle: "No Event", nextEventDate: nil)
    }

    func snapshot(for configuration: ConfigurationAppIntent, in context: Context) async -> SimpleEntry {
        await fetchNextEventEntry(configuration: configuration)
    }
    
    func timeline(for configuration: ConfigurationAppIntent, in context: Context) async -> Timeline<SimpleEntry> {
        let entry = await fetchNextEventEntry(configuration: configuration)
        return Timeline(entries: [entry], policy: .atEnd)
    }

    private func fetchNextEventEntry(configuration: ConfigurationAppIntent) async -> SimpleEntry {
        let eventStore = EKEventStore()
        let now = Date()
        let endDate = Calendar.current.date(byAdding: .day, value: 7, to: now)!
        let predicate = eventStore.predicateForEvents(withStart: now, end: endDate, calendars: nil)
        let events = eventStore.events(matching: predicate).sorted { $0.startDate < $1.startDate }
        
        if let nextEvent = events.first {
            return SimpleEntry(date: now, configuration: configuration, nextEventTitle: nextEvent.title ?? "No Title", nextEventDate: nextEvent.startDate)
        } else {
            return SimpleEntry(date: now, configuration: configuration, nextEventTitle: "No Event", nextEventDate: nil)
        }
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let configuration: ConfigurationAppIntent
    let nextEventTitle: String
    let nextEventDate: Date?
}

struct SecondWidget: Widget {
    let kind: String = "SecondWidget"

    var body: some WidgetConfiguration {
        AppIntentConfiguration(kind: kind, provider: Provider()) { entry in
            VStack(alignment: .leading) {
                Text("This is another widget!")
                    .font(.headline)
                Text("Still using the same timeline provider.")
                    .font(.caption)
            }
            .padding()
            .containerBackground(.fill.quaternary, for: .widget)
        }
    }
}

struct FirstWidget: Widget {
    let kind: String = "FirstWidget"

    var body: some WidgetConfiguration {
        AppIntentConfiguration (kind: kind, provider: Provider()) { entry in
            VStack(alignment: .leading, spacing: 0) {
                
                HStack{
                    Image(systemName:"calendar.badge.clock")
                        .font(.caption)
                    Text("Upcoming event")
                        .font(.caption)
                    Spacer()
                }
                if let eventDate = entry.nextEventDate {
                    Text("From: \(formattedDate(eventDate))")
                        .font(.caption)
                        .foregroundColor(.gray)
                    Spacer()
                    Text(entry.nextEventTitle)
                        .font(.title2)
                        .lineLimit(2)
                        .fixedSize(horizontal: false, vertical: true)
                } else {
                    Text("Your day is clear")
                }
                Spacer()
            }.padding(.vertical)
        }
    }
    
}

func formattedDate(_ date: Date) -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = "MM/dd HH:mm"
    return formatter.string(from: date)
}

@main
struct JinWidgetBundle: WidgetBundle {
    var body: some Widget {
        FirstWidget()
        SecondWidget()
    }
}



#Preview(as: .systemSmall) {
    JinWidgetBundle()
} timeline: {
    SimpleEntry(date: .now, configuration: ConfigurationAppIntent(), nextEventTitle: "Sample Event", nextEventDate: Date())
}
