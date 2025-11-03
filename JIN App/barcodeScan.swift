//
//  barcodeScan.swift
//  JIN App
//
//  Created by Jintaro Nishihata on 2025/03/17.
//

import SwiftUI

struct barcodeScan: View{
    @State private var scannedCode: String?
    var body: some View{
        VStack{
            Text("Result: \(scannedCode ?? "No data")")

            BarcodeScannerView(scannedCode: $scannedCode)
                .padding()
            
            
        }
        .toolbar(.hidden, for: .tabBar)
    }
}

struct barcodeScan_Previews: PreviewProvider{
    static var previews: some View{
        barcodeScan()
    }
}
