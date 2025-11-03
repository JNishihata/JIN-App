//
//  YearConvert.swift
//  JIN App
//
//  Created by Jintaro Nishihata on 2025/03/05.
//

import SwiftUI


struct HeiseiConvert: View{
    @State var seireki:Int = 0
    @State var reiwa:Int = 0
    @State var heisei:Int?
    @State var syowa:Int = 0
    @State var no_v = false
    @Environment(\.locale) var locale
    var body : some View{
        NavigationStack{
            Spacer()
            VStack{
                HStack{
                    Text("Heisei")
                        .font(.title)
                    TextField("heisei",
                              value: $heisei,
                              formatter: noCommaFormatter,
                              prompt: Text("Enter the year"))
                    .textFieldStyle(.roundedBorder)
                    if("ja" == locale.language.languageCode?.identifier ?? ""){
                        Text("年")
                            .font(.title)
                    }
                    Button("Convert"){
                        if(heisei != nil){
                            no_v = false
                            self.seireki = self.heisei! + 1988
                            self.syowa = self.heisei! + 63
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
                        Text("Error! (Code:lang e chack seireki if)")
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
        .animation(.default, value:seireki)
        .keyboardType(.decimalPad)
        .navigationTitle("Heisei to Other")
    }
    
    private var noCommaFormatter: NumberFormatter {
            let formatter = NumberFormatter()
            formatter.numberStyle = .decimal
            formatter.usesGroupingSeparator = false  // ← カンマなし
            return formatter
        }
}

struct HeiseiConvert_Previews: PreviewProvider{
    static var previews: some View{
        HeiseiConvert()
    }
}
