//
//  ContentView3.swift
//  JIN App
//
//  Created by Jintaro Nishihata on 2025/03/28.
//

import SwiftUI

struct OtherView:View{
    var body: some View{
        NavigationStack{
            List{
                NavigationLink(destination: Settings()){
                    HStack{
                        Image(systemName:"gear")
                        Text("Settings")
                    }
                }
                NavigationLink(destination: AboutThisApp()){
                    HStack{
                        Image(systemName: "info.circle")
                        Text("About")
                    }
                }
            }
        }
    }
}

struct OtherView_Previews: PreviewProvider{
    static var previews: some View{
        OtherView()
    }
}
