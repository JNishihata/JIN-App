//
//  JINPhoto.swift
//  JIN App
//
//  Created by Jintaro Nishihata on 2025/03/02.
//


import SwiftUI

struct JINPhoto: View{
    var body: some View{
        VStack{
            Text("電仁くん (Denjin kun)")
                .font(.title)
            Image("DenJinKun")
                .resizable()
                .scaledToFit()
            Spacer()
            Text("JIN ロゴ")
                .font(.title)
            Image("JIN")
                .resizable()
                .scaledToFit()
        }
        .navigationTitle("Photo")
    }
}

struct JINPhoto_previews : PreviewProvider{
    static var previews: some View{
        JINPhoto()
    }
}
