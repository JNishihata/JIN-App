//
//  LanguageSetting.swift
//  JIN App
//
//  Created by Jintaro Nishihata on 2025/03/04.
//
import SwiftUI

struct SettingLink: View {
    var body: some View {
        VStack {
            Text("Set_link_info")
                .padding()
            
            Button(action: {
                openAppSettings()
            }) {
                Text("Open settings app")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
            }
        }
        .navigationTitle("")
    }
    func openAppSettings() {
        if let url = URL(string: UIApplication.openSettingsURLString) {
            UIApplication.shared.open(url)
        }
    }
}
