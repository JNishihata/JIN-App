//
//  DayCalc.swift
//  JIN App
//
//  Created by Jintaro Nishihata on 2025/03/15.
//

import SwiftUI

struct DayCalc: View{
    @State var startDay = Date()
    @State var endDay = Date()
    @State var days = Double()
    var body: some View{
        VStack{
            VStack{
                DatePicker(selection: $startDay,
                           displayedComponents: [.date],
                           label: { Text("from") })
                DatePicker(selection: $endDay,
                           displayedComponents: [.date],
                           label: {Text("Until")})
                Button("Calc",action: {
                    
                })
            }
            Text("Day of between from\(startDay) to \(endDay) is ")
        }.padding()
    }
}

struct DayCalc_Previews: PreviewProvider{
    static var previews: some View{
        DayCalc()
    }
}
