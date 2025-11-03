//
//  JinWidgetLiveActivity.swift
//  JinWidget
//
//  Created by Jintaro Nishihata on 2025/03/30.
//

import ActivityKit
import WidgetKit
import EventKit
import SwiftUI

struct JinWidgetAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var eventTitle: String
        var startDate: String
        var startTime: String
        var startIsland: String
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

struct JinWidgetLiveActivity: Widget {
    @Environment(\.colorScheme) var colorScheme
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: JinWidgetAttributes.self) { context in
            // Lock screen/banner UI goes here
            VStack {
                        HStack{
                            VStack{
                                HStack{
                                    Image(systemName:"calendar.badge.clock")
                                    Text("Upcoming event")
                                }
                                
                            }
                            Spacer()
                            Text("JIN App")
                        }.padding(10)
                        Spacer()
                        Text("\(context.state.eventTitle)")
                            .font(.largeTitle)
                            .padding(1)
                        Rectangle()
                            .frame(width:320,height:1)
                            .foregroundColor(.white)
                        Text("from \(context.state.startDate)")
                        Spacer()
                        Spacer()
            }
            .activityBackgroundTint(Color.black)
            .foregroundColor(.white)
            .activitySystemActionForegroundColor(Color.black)

        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
                    Text("Next Event")
                        .padding(2)
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text("\(context.state.startTime) ~")
                        .padding(1)
                }
                DynamicIslandExpandedRegion(.bottom) {
                    Text(context.state.eventTitle)
                        .font(.title)
                    // more content
                }
            } compactLeading: {
                Image(systemName:"calendar.badge.clock")
                    .padding(1)
            } compactTrailing: {
                Text("\(context.state.startTime)~")
                    .multilineTextAlignment(.leading)
            } minimal: {
                Image(systemName:"calendar.badge.clock")
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.white)
        }
    }
}

extension JinWidgetAttributes {
    fileprivate static var preview: JinWidgetAttributes {
        JinWidgetAttributes(name: "World")
    }
}

extension JinWidgetAttributes.ContentState {
    fileprivate static var smiley: JinWidgetAttributes.ContentState {
        JinWidgetAttributes.ContentState(eventTitle: "WWDC25 Keynote",startDate:"12/05 10:00",startTime:"10:00",startIsland:"12/05\n 10:00")
     }
     
     fileprivate static var starEyes: JinWidgetAttributes.ContentState {
         JinWidgetAttributes.ContentState(eventTitle: "Apple Event",startDate:"05/12 12:00",startTime:"12:00",startIsland:"12/05\n10:00")
     }
}

#Preview("Notification", as: .content, using: JinWidgetAttributes.preview) {
   JinWidgetLiveActivity()
} contentStates: {
    JinWidgetAttributes.ContentState.smiley
    JinWidgetAttributes.ContentState.starEyes
}
