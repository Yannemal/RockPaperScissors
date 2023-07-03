//
//  ContentView.swift
//  RockPaperScissors
// DAY 25 challenge @TwoStraws 100DaysOfSwiftUI
//  Created by yannemal on 30/06/2023.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: - Data
    @State private var items = ["🧻", "🪨", "✂️"]
    @State private var cpuChoice : Int = 0
    @State private var cpuChosePaper = false
    @State private var cpuChoseRock = false
    @State private var cpuChoseScissors = false
    @State private var winTowin : Bool = false
    @State private var playerChoice : String = ""
    @State private var playerChosePaper = false
    @State private var playerChoseRock = false
    @State private var playerChoseScissors = false
    @State private var keepScore = ["⬛️", "⬛️", "⬛️", "⬛️", "⬛️", "⬛️", "⬛️", "⬛️", "⬛️", "⬛️"]
    @State private var currentRound : Int = 0
    
    
    var body: some View {
        
        
        // MARK: - VIEWDidLoad
        ZStack{
            RadialGradient(colors: [.blue, .black], center: .trailing, startRadius: 50, endRadius: 600)
                .ignoresSafeArea()
            Color(red: 57/255, green: 61/255, blue: 53/255)
                .ignoresSafeArea()
                .overlay(Material.ultraThin)
                .opacity(0.7)
            
            VStack {
                //currentRound:
                Text(" ✿  ROUND \(currentRound )  ✿ ")
                    .font(.system(size: 40))
                    .bold()
                    .foregroundColor(.gray)
                    .padding(20)
                // CPU section:
                Text("CPU chooses : ")
                    .font(.system(size: 30))
                    .bold()
                HStack{
                    Text(items[0])
                        .font(.system(size: 80))
                        .shadow(color: .white, radius: cpuChosePaper ? 15 : 0)
                    Text(items[1])
                        .font(.system(size: 80))
                        .shadow(color: .white, radius: cpuChoseRock ? 15 : 0)
                    Text(items[2])
                        .font(.system(size: 80))
                        .rotationEffect(.degrees(90))
                        .shadow(color: .white, radius: cpuChoseScissors ? 15 : 0)
                    
                }
                .padding(.bottom, 30)
                
                // modifier section:
                Text("to win .. choose wisely : ")
                    .font(.system(size: 30))
                    .bold()
                HStack{
                    Text("🏆")
                        .font(.system(size: 100))
                        .foregroundColor(.primary)
                        .shadow(color: .green, radius: winTowin ? 20 : 0)
                    
                    Text("or")
                        .font(.system(size:80))
                        .foregroundColor(.primary)
                    Text("☹️")
                        .font(.system(size: 80))
                        .foregroundColor(.primary)
                        .shadow(color: .red, radius: !winTowin ? 25 : 0)
                }
                
                Text("player chooses : ")
                    .font(.system(size: 30))
                    .bold()
                    .padding(.top, 30)
                
                HStack{
                    Button(items[2]) {
                        // action
                    }   .font(.system(size: 80))
                        .foregroundColor(.primary)
                        .rotationEffect(.degrees(180))
                        .shadow(color: .white, radius: playerChoseScissors ? 25 : 0)
                    Button(items[1]) {
                        // action
                    }   .font(.system(size: 80))
                        .foregroundColor(.primary)
                        .rotationEffect(.degrees(180))
                        .shadow(color: .white, radius: playerChoseRock ? 25 : 0)

                    Button(items[0]) {
                        // action
                    }   .font(.system(size: 80))
                        .foregroundColor(.primary)
                        .rotationEffect(.degrees(90))
                        .shadow(color: .white, radius: playerChosePaper ? 25 : 0)

                }
                Spacer()
                // keep score section:
                HStack{
                    ForEach(0..<keepScore.count, id: \.self) {
                        Text("\(keepScore[$0])")

                    }

                }
                
            }
        }
    }

// MARK: - METHODS
    func itemTapped(choice: Int){
                //code for playerChoosing
            }
        
    
}
// MARK: - PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
