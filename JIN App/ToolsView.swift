//
//  ContentView.swift
//  JIN App
//
//  Created by Jintaro Nishihata on 2025/02/28.
//

import SwiftUI


struct ToolsView: View {
    @Environment(\.openURL) var openURL
    let input: [(String,String,AnyView)] =
    [(String(localized:"Toggle"),"switch.2",AnyView(ConditionalView())),
     (String(localized:"Color Picker"),"pencil.and.outline",AnyView(ColorPick())),
     (String(localized:"Slider"),"slider.horizontal.3",AnyView(RectSlid())),
     (String(localized: "Text Field"),"character.textbox",AnyView(Textbox()))]
    let output: [(String,String,AnyView)] =
    [(String(localized: "Gauge"),"gauge",AnyView(gauge()))]
    var body: some View {
        NavigationStack{
            
            List{
                Section("Student Assosiation"){
                    NavigationLink(destination:Passwords()){
                        HStack{
                            Image(systemName:"key")
                            Text("Passwords")
                        }
                    }
                }
                Section("Tools"){
                    NavigationLink(destination: YearConvert()){
                        HStack{
                            Image(systemName:"calendar")
                            Text("Year Converter")
                        }
                    }
//                    NavigationLink(destination: barcodeScan()){
                        HStack{
                            Image(systemName:"barcode.viewfinder")
                            Text("BarcodeScan β   (You can't use)")
                        }
//                    }
                    NavigationLink(destination: SheetConverterView()){
                        HStack{
                            Image(systemName:"")
                            Text("Sheet Converter")
                        }
                    }
                }
                Section("Input"){
                    ForEach(input, id: \.0){input in
                        NavigationLink(destination: input.2){
                            HStack{
                                Image(systemName: input.1)
                                Text(input.0)
                            }
                        }
                    }
                }
                Section("Output"){
                    ForEach(output, id: \.0){output in
                        NavigationLink(destination: output.2){
                            HStack{
                                Image(systemName: output.1)
                                Text(output.0)
                            }
                        }
                    }
                }
            }
        }
    }
}


struct ToolsView_previews: PreviewProvider{
    static var previews: some View{
        ToolsView()
    }
}
