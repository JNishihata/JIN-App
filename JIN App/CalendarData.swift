import EventKit
import SwiftUI

class CalendarData: ObservableObject {
    static let shared = CalendarData() // シングルトン
    
    private let eventStore = EKEventStore()
    @Published var nextEvent: EKEvent?
    @Published var nextNormalEvent: EKEvent?
    @Published var authorizationStatus: EKAuthorizationStatus = .notDetermined
    
    func checkAuthorizationStatus() {
            let status = EKEventStore.authorizationStatus(for: .event)
            DispatchQueue.main.async {
                self.authorizationStatus = status
            }
        }
    
    @MainActor
    func requestCalAccess(){
        eventStore.requestFullAccessToEvents { granted, error in
            if granted{
                self.fetchNextEvent()
            }
            else{
                print("Calendar access declined")
            }
        }
    }
    
    func requestReminderAccess(){
        eventStore.requestFullAccessToReminders { granted, error in
            if granted{
                self.fetchReminders()
            }
            else{
                print("Reminder access declined")
            }
        }
    }
    func fetchNextEvent(){
        Task{
            let now = Date()
            let endDate = Calendar.current.date(byAdding: .day, value: 7, to:now)!
            let predicate = eventStore.predicateForEvents(withStart: now, end: endDate, calendars:nil)
            let events = eventStore.events(matching: predicate).sorted { $0.startDate < $1.startDate }
            DispatchQueue.main.async {
                self.nextEvent = events.first
                if let firstEvent = self.nextEvent, firstEvent.isAllDay {
                    self.nextNormalEvent = events.first(where: { !$0.isAllDay })
                }
            }
        }
    }
    func fetchReminders(){
        Task{
            let predicateReminder: NSPredicate = eventStore.predicateForReminders(in:nil)
            eventStore.fetchReminders(matching: predicateReminder, completion: { reminders in
                
                guard let reminders = reminders else { return}
            })
        }
    }
}

