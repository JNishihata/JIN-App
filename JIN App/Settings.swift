//
//  Settings.swift
//  JIN App
//
//  Created by Jintaro Nishihata on 2025/03/04.
//

import SwiftUI
import EventKit

struct Settings: View {
    var body: some View {
        NavigationStack{
            List{
                NavigationLink(destination: SettingLink()){
                    HStack{
                        Image(systemName: "globe")
                        Text("Language")
                    }
                }
                Section("authorization status"){
                    NavigationLink(destination: SettingLink()){
                        HStack{
                            Image(systemName: "calendar")
                            Text("Calender")
                            Spacer()
                            switch EKEventStore.authorizationStatus(for: .event){
                            case .notDetermined:
                                Text("Not Detemined")
                                    .foregroundColor(.secondary)
                            case .restricted:
                                Text("Restricted")
                                    .foregroundColor(.secondary)
                            case .denied:
                                Text("Denied")
                                    .foregroundColor(.secondary)
                            case .fullAccess:
                                Text("Full Access")
                                    .foregroundColor(.secondary)
                            case .writeOnly:
                                Text("Add Events Only")
                                    .foregroundColor(.secondary)
                            @unknown default:
                                Text("Error")
                                    .foregroundColor(.secondary)
                            }
                        }
                    }
                }
            }
        }.navigationTitle(Text("Settings"))
            .toolbar(.hidden, for: .tabBar)
    }
}

struct Settings_Preview: PreviewProvider{
    static var previews: some View{
        Settings()
    }
}
