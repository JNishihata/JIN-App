//
//  ContentView.swift
//  JIN App
//
//  Created by Jintaro Nishihata on 2026/03/09.
//

import SwiftUI

struct ContentView: View{
    @State var tabTitle:String = ""
    var body: some View{
        TabView(selection: $tabTitle){
            Tab("For You", systemImage:"star",value:"For You"){
                NavigationStack{
                    Startmenu()
                        .navigationTitle(tabTitle)
                }
            }
            Tab("Tools", systemImage: "wrench.and.screwdriver", value:"Tools"){
                NavigationStack{
                    ToolsView()
                        .navigationTitle(tabTitle)
                }
            }
            Tab("Discover", systemImage: "safari", value: "Discover"){
                NavigationStack{
                    DiscoverView()
                        .navigationTitle(tabTitle)
                }
            }
            Tab("Other",systemImage:"ellipsis", value:"Other"){
                NavigationStack{
                    OtherView()
                        .navigationTitle(tabTitle)
                }
            }
        }.tabViewStyle(.sidebarAdaptable)
    }
}

#Preview {
    ContentView()
}
