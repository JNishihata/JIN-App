//
//  YearConvert.swift
//  JIN App
//
//  Created by Jintaro Nishihata on 2025/03/05.
//

import SwiftUI


struct ReiwaConvert: View{
    @State var seireki:Int = 0
    @State var reiwa:Int?
    @State var heisei:Int = 0
    @State var syowa:Int = 0
    @State var no_v = false
    @Environment(\.locale) var locale
    var body : some View{
        NavigationStack{
            Spacer()
            VStack{
                HStack{
                    Text("Reiwa")
                        .font(.title)
                    TextField("reiwa",
                              value: $reiwa,
                              formatter: noCommaFormatter,
                              prompt: Text("Enter the year"))
                    .padding()
                    .textFieldStyle(.roundedBorder)
                    Button("Convert"){
                        if(reiwa != nil){
                            no_v = false
                            self.seireki = self.reiwa! + 2018
                            self.heisei = self.reiwa! + 30
                            self.syowa = self.reiwa! + 93
                        }
                        else{
                            no_v = true
                        }
                    }
                    .frame(width:100, height:5)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                }
                if(no_v){
                    Text("Enter the number")
                        .foregroundColor(.red)
                }
            }.padding()
            HStack{
                if(seireki > 0){
                    if("en" == locale.language.languageCode?.identifier ?? ""){
                        Text("Seireki : \(String(seireki))")
                            .font(.largeTitle)
                    }
                    else if("ja" == locale.language.languageCode?.identifier ?? ""){
                        Text("西暦 \(String(seireki)) 年")
                            .font(.largeTitle)
                    }
                    else{
                        Text("Error! (Code:lang e chack heisei if)")
                    }
                }
                
            }
            HStack{
                if(heisei > 0){
                    if("en" == locale.language.languageCode?.identifier ?? ""){
                        Text("Heisei : \(String(heisei))")
                            .font(.largeTitle)
                    }
                    else if("ja" == locale.language.languageCode?.identifier ?? ""){
                        if(heisei == 1){
                            Text("平成 元年")
                                .font(.largeTitle)
                        }
                        else{
                            Text("平成 \(String(heisei)) 年")
                                .font(.largeTitle)
                        }
                    }
                    else{
                        Text("Error! (Code:lang e chack heisei if)")
                    }
                }
                
            }
            HStack{
                if(syowa > 0){
                    if("en" == locale.language.languageCode?.identifier ?? ""){
                        Text("Syowa : \(String(syowa))")
                            .font(.largeTitle)
                    }
                    else if("ja" == locale.language.languageCode?.identifier ?? ""){
                        if(syowa == 1){
                            Text("昭和 元年")
                                .font(.largeTitle)
                        }
                        else{
                            Text("昭和 \(String(syowa)) 年")
                                .font(.largeTitle)
                        }
                    }
                    else{
                        Text("Error! (Code:lang e chack syowa if)")
                    }
                }
            }
            Spacer()
        }
        .animation(.default, value:syowa)
        .keyboardType(.decimalPad)
        .navigationTitle("Reiwa to Other")
    }
    
    private var noCommaFormatter: NumberFormatter {
            let formatter = NumberFormatter()
            formatter.numberStyle = .decimal
            formatter.usesGroupingSeparator = false  // ← カンマなし
            return formatter
        }
}

struct ReiwaConvert_Previews: PreviewProvider{
    static var previews: some View{
        ReiwaConvert()
    }
}
