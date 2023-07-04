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
    @State private var cpuChoice : String = ""
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
                        // action player chose Scissor
                        playerChoice = items[2]
                        playerChoseScissors = true
                        playerChoseRock = false
                        playerChosePaper = false
                    }   .font(.system(size: 80))
                        .foregroundColor(.primary)
                        .rotationEffect(.degrees(180))
                        .shadow(color: .white, radius: playerChoseScissors ? 25 : 0)
                    Button(items[1]) {
                        // action player chose rock
                        playerChoice = items[1]
                        playerChoseRock = true
                        playerChoseScissors = false
                        playerChosePaper = false
                    }   .font(.system(size: 80))
                        .foregroundColor(.primary)
                        .rotationEffect(.degrees(180))
                        .shadow(color: .white, radius: playerChoseRock ? 25 : 0)
                    
                    
                    Button(items[0]) {
                        // action player chose paper
                        playerChoice = items[0]
                        playerChosePaper = true
                        playerChoseRock = false
                        playerChoseScissors = false
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
    
    func resetGame() {
        currentRound = 0
        keepScore = ["⬛️", "⬛️", "⬛️", "⬛️", "⬛️", "⬛️", "⬛️", "⬛️", "⬛️", "⬛️"]
        cpuChoice = items.randomElement() ?? ""
        
        winTowin = Bool.random()
        playerChoice  = items.randomElement() ?? ""
        playerChosePaper = false
        playerChoseRock = false
        playerChoseScissors = false
    }
    
    func newRoundShuffle() {
        playerChoice  = ""
        playerChosePaper = false
        playerChoseRock = false
        playerChoseScissors = false
        // shuffle CPU and modifier
        cpuChoice = items.randomElement() ?? ""
        switch cpuChoice {
        case items[0] :  cpuChosePaper = true
                         cpuChoseRock = false
                         cpuChoseScissors = false

        case items[1] : cpuChosePaper = false
                        cpuChoseRock = true
                        cpuChoseScissors = false

        case items[2] : cpuChosePaper = false
                        cpuChoseRock = false
                        cpuChoseScissors = true
        default:
            print("error while newRoundShuffle")
        }
        winTowin = Bool.random()
    }
    
    // TODO: player push button
    func itemTapped(choice: Int){
        //code for playerChoosing and pushing button
    }
    
    
    func checkOutcome()  {
        // check cpu + modifier + player > @State no need for parameters
        // outcome win return true  >> maybe not return
        // can I nest Switch statements ?
        switch player {
        case items[2] :
            switch cpuChoice {
            case items[0]:
                switch winTowin {
                case true :
                case false:
                default :
                    print("error while checking playerChoice, cpuChoice then modifier 1")
                }
            case items[1]:
                switch winTowin {
                case true :
                case false:
                default :
                    print("error while checking playerChoice, cpuChoice then modifier 2")
                }
            case items[2]:
                switch winTowin {
                case true :
                case false:
                default :
                    print("error while checking playerChoice, cpuChoice then modifier 3")
                }
            default:
                print("error while switch Player then cpu choice")
            }
            
            
        case items[1] :
            switch cpuChoice {
            case items[0]:
                switch winTowin {
                case true :
                case false:
                default :
                    print("error while checking playerChoice, cpuChoice then modifier 1")
                }
            case items[1]:
                switch winTowin {
                case true :
                case false:
                default :
                    print("error while checking playerChoice, cpuChoice then modifier 2")
                }
            case items[2]:
                switch winTowin {
                case true :
                case false:
                default :
                    print("error while checking playerChoice, cpuChoice then modifier 3")
                }
            default:
                print("error while switch Player then cpu choice")
            }
        case items[0] :
            switch cpuChoice {
            case items[0]:
                switch winTowin {
                case true :
                case false:
                default :
                    print("error while checking playerChoice, cpuChoice then modifier 1")
                }
            case items[1]:
                switch winTowin {
                case true :
                case false:
                default :
                    print("error while checking playerChoice, cpuChoice then modifier 2")
                }
            case items[2]:
                switch winTowin {
                case true :
                case false:
                default :
                    print("error while checking playerChoice, cpuChoice then modifier 3")
                }
            default:
                print("error while switch Player then cpu choice")
            }
            
        default:
            print("error while checkOutcome")
        }
        
        
        
    }
    
    func scoreRound(round: Int, result: Bool) {
        // update keepScoreArray
        
        // next round
        if currentRound == 11 {
            // alert with final score > continue = reset
            // resetGame()
        } else {
            currentRound += 1
            newRoundShuffle()
        }
        
    }
}
// MARK: - PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
