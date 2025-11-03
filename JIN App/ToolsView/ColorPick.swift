//
//  ColorPick.swift
//  JIN App
//
//  Created by Jintaro Nishihata on 2025/03/02.
//
import SwiftUI

struct ColorPick: View{
    @State var color = Color.primary
    
    var body: some View{
        TabView{
            VStack{
                Rectangle()
                    .fill(color)
                    .frame(width: 300, height: 300)
                
                ColorPicker("Color Picker", selection: $color)
                    .toolbar(.hidden, for: .tabBar)
            }
        }.padding()
            .navigationTitle("Color Picker")
    }
}

