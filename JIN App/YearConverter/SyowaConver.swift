//
//  YearConvert.swift
//  JIN App
//
//  Created by Jintaro Nishihata on 2025/03/05.
//

import SwiftUI


struct SyowaConvert: View{
    @State var seireki:Int = 0
    @State var reiwa:Int = 0
    @State var heisei:Int = 0
    @State var syowa:Int?
    @State var no_v = false
    @Environment(\.locale) var locale
    var body : some View{
        NavigationStack{
            Spacer()
            VStack{
                HStack{
                    Text("Syowa")
                        .font(.title)
                    TextField("Syowa",
                              value: $syowa,
                              formatter: noCommaFormatter,
                              prompt: Text("Enter the year"))
                    .padding()
                    .textFieldStyle(.roundedBorder)
                    Button("Convert"){
                        if(syowa != nil){
                            no_v = false
                            self.seireki = self.syowa! + 1925
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
            Spacer()
        }
        .animation(.default, value:seireki)
        .keyboardType(.decimalPad)
        .navigationTitle("Syowa to Seireki")
    }
    
    private var noCommaFormatter: NumberFormatter {
            let formatter = NumberFormatter()
            formatter.numberStyle = .decimal
            formatter.usesGroupingSeparator = false  // ← カンマなし
            return formatter
        }
}

struct SyowaConvert_Previews: PreviewProvider{
    static var previews: some View{
        SyowaConvert()
    }
}
