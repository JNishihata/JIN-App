//
//  gauge.swift
//  JIN App
//
//  Created by Jintaro Nishihata on 2025/03/03.
//

import SwiftUI

struct gauge: View {
    @State var value1: Double = 0
    @State var value2: Double = 0
    @State var value3: Double = 0
    @State var value4: Double = 0
    var body: some View {
        
        VStack {
            Gauge(value: value1, in: 0...1) {
                Text("1")
            }.padding()
                .accentColor(.red)
            Gauge(value: value2, in: 0...1) {
                Text("2")
            }.padding()
                .accentColor(.yellow)
            Gauge(value: value3, in: 0...1) {
                Text("3")
            }.padding()
                .accentColor(.green)
            Gauge(value: value4, in: 0...1){
                Text("4")
            }.padding()
                .accentColor(.blue)
            Gauge(value: value1 + value2 + value3 + value4, in: 0...4) {
                Text("Total")
            }.padding()
                .accentColor(.gray)
            
            Slider(value: $value1)
                .padding()
                .accentColor(.red)
            Slider(value: $value2)
                .padding()
                .accentColor(.yellow)
            Slider(value: $value3)
                .padding()
                .accentColor(.green)
            Slider(value: $value4)
                .padding()
                .accentColor(.blue)
            
        }
        .navigationTitle("Gauge")
        .toolbar(.hidden, for: .tabBar)
    }
}

struct gauge_Previews: PreviewProvider {
    static var previews: some View {
        gauge()
    }
}
