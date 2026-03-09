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
    @State var tabtitle: String = "For You"
    var body: some Scene {
        WindowGroup {
            TabView(selection: $tabtitle){
                Tab("For You", systemImage:"star",value:"For You"){
                    NavigationStack{
                        Startmenu()
                            .navigationTitle(tabtitle)
                    }
                }
                Tab("Tools", systemImage: "wrench.and.screwdriver", value:"Tools"){
                    NavigationStack{
                        ToolsView()
                            .navigationTitle(tabtitle)
                    }
                }
                Tab("Discover", systemImage: "safari", value: "Discover"){
                    NavigationStack{
                        DiscoverView()
                            .navigationTitle(tabtitle)
                    }
                }
                Tab("Other",systemImage:"ellipsis", value:"Other"){
                    NavigationStack{
                        OtherView()
                            .navigationTitle(tabtitle)
                    }
                }
            }.tabViewStyle(.sidebarAdaptable)
        }
    }
}

