//
//  JIN_AppApp.swift
//  JIN App
//
//  Created by Jintaro Nishihata on 2025/02/28.
//

import SwiftUI



@main
struct JIN_AppApp: App {
    enum Tabs: String{
        case tab1 = "Main"
        case tab2 = "Discover"
    }
    @State var tabtitle: String = "JIN App"
    var body: some Scene {
        WindowGroup {
            NavigationStack{
                TabView(selection: $tabtitle){
                    Tab("For You", systemImage:"star",value:"For You"){
                        Startmenu()
                    }
                    Tab("Tools", systemImage: "wrench.and.screwdriver", value:"Tools"){
                        ToolsView()
                    }
                    Tab("Discover", systemImage: "safari", value: "Discover"){
                        DiscoverView()
                    }
                    Tab("Other",systemImage:"ellipsis", value:"Other"){
                        OtherView()
                    }
                }
                .navigationTitle(tabtitle)
            }
        }
    }
}

