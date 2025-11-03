//
//  Bukatusyoukai.swift
//  JIN App
//
//  Created by Jintaro Nishihata on 2025/04/08.
//

import SwiftUI
import LocalAuthentication

struct Passwords: View{
    @State private var isUnlocked = false
    var body: some View{
        NavigationStack{
            if(isUnlocked == true){
                List{
                    Section("Key"){
                        HStack{
                            Text("会室")
                            Spacer()
                            Text("2543")
                        }
                    }
                    Section("PC"){
                        HStack{
                            Text("会計PC")
                            Spacer()
                            Text("0502")
                        }
                        HStack{
                            Text("デスクトップPC")
                            Spacer()
                            Text("0505")
                        }
                        HStack{
                            Text("ノートPC")
                            Spacer()
                            Text("gakuseikai")
                        }
                    }
                    Section("ロッカー"){
                        HStack{
                            Text("会計上")
                            Spacer()
                            Text("827")
                        }
                        HStack{
                            Text("会計下")
                            Spacer()
                            Text("829")
                        }
                    }
                }
            }
            else{
                Text("Authentication required")
                    .font(.title)
                Button("Authenticate"){
                    authenticate()
                }.padding()
                    .background(Color.green)
                    .cornerRadius(10)
                    .foregroundColor(.white)
            }
        }.navigationTitle("Passwords")
            .onAppear{
                authenticate()
            }
    }
    
    
    func authenticate(){
        let context = LAContext()
        var error: NSError?
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error){
            let description = "Authentication required."
            
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: description) { success, authenticationError in
                DispatchQueue.main.async{
                    if success{
                        self.isUnlocked = true
                    }
                    else{
                        self.isUnlocked = false
                    }
                }
            }
        }
    }
}



struct Passwords_Previews:PreviewProvider{
    static var previews:some View{
        Passwords()
    }
}
