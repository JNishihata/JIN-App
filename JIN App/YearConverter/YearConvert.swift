//
//  YearConvert.swift
//  JIN App
//
//  Created by Jintaro Nishihata on 2025/03/05.
//

import SwiftUI


struct YearConvert: View{
    var body : some View{
        NavigationStack{
            List{
                NavigationLink(destination: SeirekiConvert()){
                    Text("Seireki to Nengo")
                }
                NavigationLink(destination: ReiwaConvert()){
                    Text("Reiwa to Other")
                }
                NavigationLink(destination: HeiseiConvert()){
                    Text("Heisei to Other")
                }
                NavigationLink(destination: SyowaConvert()){
                    Text("Syowa to Seireki")
                }
                
                
            }
        }.navigationTitle(Text("Year Menu"))
            .toolbar(.hidden, for: .tabBar)
    }
}

struct YearConvert_Previews: PreviewProvider{
    static var previews: some View{
        YearConvert()
    }
}
