//
//  ContentView.swift
//  RockPaperScissors
// DAY 25 challenge @TwoStraws 100DaysOfSwiftUI
//  Created by yannemal on 30/06/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            RadialGradient(colors: [.blue, .black], center: .trailing, startRadius: 50, endRadius: 600)
                .ignoresSafeArea()
            Color(red: 57/255, green: 61/255, blue: 53/255)
                .ignoresSafeArea()
                .overlay(Material.ultraThin)
                .opacity(0.7)
            
            VStack {
            
                HStack{
                    Text("🪨")
                        .font(.system(size: 100))
                        .rotationEffect(.degrees(180))
                         .shadow(color: .white ,radius: 8)
                         
                    Text("🧻")
                        .font(.system(size: 100))
                    Text("✂️")
                        .font(.system(size: 100))
                        .rotationEffect(.degrees(90))
                    
                }
                Text("🏆 or ☹️")
                    .font(.system(size: 100))
                    .foregroundColor(.primary)
                
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
