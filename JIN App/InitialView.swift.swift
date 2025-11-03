//
//  InitialView.swift.swift
//  JIN App
//
//  Created by Jintaro Nishihata on 2025/03/31.
//

import SwiftUI

struct InitialView: View {
    
    @AppStorage("is_init") var isInit = true    // 初回画面フラグ
    @State var page: Int = 1                    // ページ番号
    
    var body: some View {
        if isInit {
            switch page {
            case 1:
                Intro1View(page: $page)
            case 2:
                Intro2View(page: $page)
            case 3:
                Intro3View(page: $page)
            default:
                Startmenu()
            }
        } else {
            Startmenu()
        }
    }
}

struct Intro1View: View {
    
    @Binding var page: Int
    
    var body: some View {
        ZStack{
            Color.yellow
                .ignoresSafeArea()
            VStack {
                Text("Intro1")
                Button("Next >") {
                    withAnimation(){
                        page = 2
                    }
                }
                .padding()
            } // HStack
        } // ZStack
    }
}

struct Intro2View: View {
    
    @Binding var page: Int
    
    var body: some View {
        ZStack{
            Color.green
                .ignoresSafeArea()
            VStack {
                Text("Intro2")
                HStack{
                    Button("< Back") {
                        withAnimation(){
                            page = 1
                        }
                    }
                    Button("Next >") {
                        withAnimation(){
                            page = 3
                        }
                    }
                } // HStack
                .padding()
            } // VStack
        }  // ZStack
    }
}
struct Intro3View: View {
    
    @Binding var page: Int
    @AppStorage("is_init") var isInit = true    // 初回画面フラグ
    
    var body: some View {
        ZStack{
            Color.mint
                .ignoresSafeArea()
            VStack {
                Text("Intro3")
                HStack{
                    Button("< Back") {
                        withAnimation(){
                            page = 2
                        }
                    }
                    Button("Start!") {
                        withAnimation(){
                            isInit = false  // 二度とtrueに戻せなくなる
                            page = 1
                        }
                    }
                } // HStack
                .padding()
            } // VStack
        }  // ZStack
    }
}
