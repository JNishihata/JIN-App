//
//  ConditionalView.swift
//  JIN App
//
//  Created by Jintaro Nishihata on 2025/03/02.
//

import SwiftUI

struct ConditionalView: View{
    @State var SW1: Bool = false
    var body: some View{
        VStack{
            VStack{
                Circle()
                    .frame(width: 350)
                    .foregroundColor(SW1 ? .yellow : .black)
                    .shadow(color: SW1 ? .yellow : .gray, radius: 10)
                    .scaleEffect(SW1 ? 1 : 0.75)
                    .animation(.default, value: SW1)
                    .padding()
                HStack{
                    Spacer()
                    Toggle(String(localized: "Switch"), isOn: $SW1)
                        .padding()
                    Spacer()
                }
            }
            
        }
        .navigationTitle("Toggle")
        .toolbar(.hidden, for: .tabBar)
    }
}

#Preview{
    ConditionalView()
}
