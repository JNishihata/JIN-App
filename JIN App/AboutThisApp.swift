//
//  AboutThisApp.swift
//  JIN App
//
//  Created by Jintaro Nishihata on 2025/03/03.
//

import SwiftUI

struct AboutThisApp: View{
    let ver = "3.2.0"
    var body: some View{
        NavigationStack{
            List{
                HStack{
                    Text("App Name")
                    Spacer()
                    Text("JIN App")
                        .foregroundColor(.secondary)
                }
                NavigationLink(destination: version()){
                    HStack{
                        Text("App Version")
                        Spacer()
                        Text(ver)
                            .foregroundColor(.secondary)
                    }
                }
                HStack{
                    Text("Creater")
                    Spacer()
                    Text("Jintaro Nishihata")
                        .foregroundColor(.secondary)
                }
                HStack{
                    Text("Copyright")
                    Spacer()
                    Text("©︎Jintaro Nishihata 2025")
                        .foregroundColor(.secondary)
                }
            }
            .navigationTitle("About")
        }
    }
}

struct AboutThisApp_Previews: PreviewProvider {
    static var previews: some View {
        AboutThisApp()
    }
}
