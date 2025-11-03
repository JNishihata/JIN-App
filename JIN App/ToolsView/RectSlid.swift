//
//  RectSlid.swift
//  JIN App
//
//  Created by Jintaro Nishihata on 2025/03/02.
//

import SwiftUI

struct RectSlid: View{
    @State var width : Double = 0
        var body: some View {
            VStack {
                Rectangle()
                    .frame(width: width * 300)
                Slider(value: $width)
            }
            .padding()
            .navigationTitle("Slider")
        }
}

#Preview{
    RectSlid()
}
