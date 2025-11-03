//
//  ContentView2.swift
//  JIN App
//
//  Created by Jintaro Nishihata on 2025/03/26.
//

import SwiftUI

struct DiscoverView: View{
    @Environment(\.openURL) var openURL
    var body: some View{
        
        ScrollView{
            VStack{
                Text("Nothig to see here.")
            }.navigationTitle("Discover")
        }
    }
}
struct DiscoverView_Previews: PreviewProvider{
    static var previews: some View{
        DiscoverView()
    }
}
