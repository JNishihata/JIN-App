//
//  Textbox.swift
//  JIN App
//
//  Created by Jintaro Nishihata on 2025/03/03.
//

import SwiftUI

struct Textbox : View{
    @State var text: String = ""
    var body: some View{
        VStack{
            TextField("Enter text here.", text: $text)
                .padding()
                Text("Text will show here:")
            ZStack{
               
                Rectangle()
                    .frame(height: 50)
                    .foregroundColor(.gray)
                    .padding()
                Text(text)
                    .padding()
            }
            Button("Clear"){
                self.text = ""
            }.foregroundColor(.blue)
                .backgroundStyle(Color.blue)
        }
        .navigationTitle(Text("Text Field"))
        .toolbar(.hidden, for: .tabBar)
    }
}

struct Textbox_Previews : PreviewProvider {
    static var previews: some View {
        Textbox()
    }
}
