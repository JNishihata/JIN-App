//
//  SheetConverter.swift
//  JIN App
//
//  Created by Jintaro Nishihata on 2025/07/22.
//

import SwiftUI

struct SheetConverterView: View {
    @State private var columnLetters: String = ""
    @State private var columnNumber: Int? = nil
    @State private var showAlert: Bool = false
    @State private var alertMessage: String = ""

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("列文字を入力")) {
                    TextField("例: A, Z, AA, BC", text: $columnLetters)
                        .autocapitalization(.allCharacters)
                        .disableAutocorrection(true)
                        .keyboardType(.asciiCapable) // ASCII文字のみ簡単にH入力できるようにする
                }

                Section {
                    Button("列番号を計算") {
                        calculateColumnNumber()
                    }
                }

                if let number = columnNumber {
                    Section(header: Text("結果")) {
                        HStack {
                            Text("列番号:")
                            Spacer()
                            Text("\(number)")
                                .font(.headline)
                        }
                    }
                }
            }
            .navigationTitle("列番号変換")
            .alert(isPresented: $showAlert) {
                Alert(title: Text("エラー"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
            }
        }
    }

    private func calculateColumnNumber() {
        guard !columnLetters.isEmpty else {
            columnNumber = nil
            alertMessage = "列文字を入力してください。"
            showAlert = true
            return
        }

        let uppercasedLetters = columnLetters.uppercased()
        var number = 0
        var power = 0

        for char in uppercasedLetters.reversed() {
            if let asciiValue = char.asciiValue {
                // 'A' は65なので、'A' - 'A' + 1 = 1、'B' - 'A' + 1 = 2、などとなります
                let value = Int(asciiValue - Character("A").asciiValue! + 1)
                
                // 文字が有効な範囲 (A-Z) 内にあることを確認
                if value < 1 || value > 26 {
                    columnNumber = nil
                    alertMessage = "無効な文字が含まれています。A-Zの文字のみ使用してください。"
                    showAlert = true
                    return
                }
                
                number += value * Int(pow(26.0, Double(power)))
                power += 1
            } else {
                columnNumber = nil
                alertMessage = "無効な文字が含まれています。A-Zの文字のみ使用してください。"
                showAlert = true
                return
            }
        }
        columnNumber = number
    }
}

struct SheetConverterView_Previews: PreviewProvider {
    static var previews: some View {
        SheetConverterView()
    }
}
