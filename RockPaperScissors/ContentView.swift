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
    @State private var cpuChoice : String = "🪨"
    @State private var cpuChosePaper = false
    @State private var cpuChoseRock = true
    @State private var cpuChoseScissors = false
    
    @State private var winTowin : Bool = true
    
    @State private var playerChoice : String = ""
    @State private var playerChosePaper = false
    @State private var playerChoseRock = false
    @State private var playerChoseScissors = false
    
    @State private var resultMessage = ""
    @State private var showingMessage : Bool = false
    @State private var score : Int = 0
    
    @State private var keepScore = ["⬛️", "⬛️", "⬛️", "⬛️", "⬛️", "⬛️", "⬛️", "⬛️", "⬛️", "⬛️"]
    @State private var currentRound : Int = 1
    @State private var gameOver = false
    
    
    
    
    var body: some View {
        
        
        // MARK: - VIEWDidLoad
        ZStack{
            RadialGradient(colors: [.blue, .black], center: .trailing, startRadius: 50, endRadius: 600)
                .ignoresSafeArea()
            Color(red: 57/255, green: 61/255, blue: 53/255)
                .ignoresSafeArea()
                .overlay(Material.ultraThin)
                .opacity(showingMessage ? 0.5 : 0.7)
            
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
                        if currentRound == 10 {
                            //endGame
                            resultMessage = "Game Over"
                            gameOver = true
                            showingMessage = true
                        } else {
                            
                            itemTapped(choice: items[2])
                        }
                    }   .font(.system(size: 80))
                        .foregroundColor(.primary)
                        .rotationEffect(.degrees(180))
                        .shadow(color: .white, radius: playerChoseScissors ? 25 : 0)
                    
                    
                    Button(items[1]) {
                        // action player chose rock
                        if currentRound == 10 {
                            //endGame
                            resultMessage = "Game Over"
                            gameOver = true
                            showingMessage = true
                        } else {
                            
                            itemTapped(choice: items[1])
                        }
                    }   .font(.system(size: 80))
                        .foregroundColor(.primary)
                        .rotationEffect(.degrees(180))
                        .shadow(color: .white, radius: playerChoseRock ? 25 : 0)
                    
                    
                    Button(items[0]) {
                        // action player chose paper
                        if currentRound == 10 {
                            //endGame
                            resultMessage = "Game Over"
                            gameOver = true
                            showingMessage = true
                        } else {
                            
                            itemTapped(choice: items[0])
                        }
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
        } // end ZStack > alert pop up is always on top but hidden or shown based on Bool
        .alert(resultMessage, isPresented: $showingMessage) {
            Button("Next", action: gameOver ? resetGame : newRoundShuffle)
        } message: {
            Text("player score = \(score)")
        }
        // how does it turn showingMessage back to false ? protocol maybe ?

        
    } //end someView  - continue. struct ContentView
    
    // MARK: - METHODS
    
    func itemTapped(choice: String){
        playerChoice = choice
        switch playerChoice {
        case "✂️" :
            playerChoseScissors = true
            playerChoseRock = false
            playerChosePaper = false

        case "🪨"  :
            playerChoseScissors = false
            playerChoseRock = true
            playerChosePaper = false
            
        case "🧻" :
            playerChoseScissors = false
            playerChoseRock = false
            playerChosePaper = true

        default : print("itemTapped Error")
        }
        scoreRound(round: currentRound, result: checkOutcome())
        showingMessage = true

    }
    
    func scoreRound(round: Int, result: Bool) {
        // update keepScoreArray  result bool comes from checkOutcome func
          // round starts at 1 , index starts at 0 > subtract 1
        var roundToIndex = round
            roundToIndex -= 1
            switch result {
            case true : //player won
                score += 1
                keepScore[roundToIndex] = "🟢"
                
            case false: // player lost
                keepScore[roundToIndex] = "❌"
            }
        }

    func checkOutcome()-> Bool  {
        // check cpu + modifier + player > @State no need for parameters
        // outcome win return true  >> maybe not return
        // can I nest Switch statements ? using array[index] is not legible at all -> use emoji strings
        // added a return bool

        var resultRound : Bool = false

        switch playerChoice {
        case "✂️" :
            switch cpuChoice {
            case "🧻":
                switch winTowin {
                case true : resultMessage = "Your Scissors beat Computer Paper"
                    resultRound = true
                case false: resultMessage = "Modifier Twist : you lose!!"
                    resultRound = false

                }
            case "🪨":
                switch winTowin {
                case true : resultMessage = "Computer rock crushes your Scissors"
                    resultRound = false
                case false: resultMessage = "Modified correctly: your Super scissors win!!"
                    resultRound = true

                }
            case "✂️":
                switch winTowin {
                case true : resultMessage = "Computer and Player evenly matched"
                    resultRound = false
                case false: resultMessage = "Computer and Player evenly matched"
                    resultRound = false

                }
            default:
                print("error while switch Player then cpu choice 5a")
            }
            
            
        case "🪨" :
            switch cpuChoice {
            case "🧻":
                switch winTowin {
                case true : resultMessage = "Computer Paper covers your Rock: you lose"
                    resultRound = false
                case false: resultMessage = "Modified correctly: your Super Rock grinds paper!!"
                    resultRound = true
                
                }
            case "🪨":
                switch winTowin {
                case true : resultMessage = "Computer and Player evenly matched"
                     resultRound = false
                case false: resultMessage = "Computer and Player evenly matched"
                    resultRound = false
                    

                }
            case "✂️":
                switch winTowin {
                case true : resultMessage = "your Rock destroys Computer Scissors"
                    resultRound = true
                case false: resultMessage = "Modifier Twist : you lose!!"
                     resultRound = false

                }
            default:
                print("error while switch Player then cpu choice 5b")
            }
        case "🧻" :
            switch cpuChoice {
            case "🧻":
                switch winTowin {
                case true : resultMessage = "Computer and Player evenly matched"
                    resultRound = false
                case false: resultMessage = "Computer and Player evenly matched"
                    resultRound = false

                }
            case "🪨":
                switch winTowin {
                case true : resultMessage = "Your Paper covers Computer Rock until it falls asleep: you win!"
                    resultRound = true
                case false: resultMessage = "Modifier Twist : you lose!!"
                    resultRound = false

                }
            case "✂️":
                switch winTowin {
                case true : resultMessage = "Computer Scissors turn your Paper into confetti: you lose"
                    resultRound = false
                case false: resultMessage = "Modifier Twist : you lose!!"
                    resultRound = true

                }
            default:
                print("error while switch Player then cpu choice 5c")
            }
            
        default:
            print("error while checkOutcome 6a")
        }
        
        
        return resultRound
        
    }
    
    
    func newRoundShuffle() {
        
        currentRound += 1
        playerChoice  = ""
        resultMessage = ""
        playerChosePaper = false
        playerChoseRock = false
        playerChoseScissors = false
        // shuffle CPU and modifier
        cpuChoice = items.randomElement() ?? ""
        switch cpuChoice {
        case "🧻" :  cpuChosePaper = true
                         cpuChoseRock = false
                         cpuChoseScissors = false

        case "🪨" : cpuChosePaper = false
                        cpuChoseRock = true
                        cpuChoseScissors = false

        case "✂️" : cpuChosePaper = false
                        cpuChoseRock = false
                        cpuChoseScissors = true
        default:
            print("error while newRoundShuffle")
        }
        winTowin = Bool.random()

    }
    
    func resetGame() {
        currentRound = 1
        gameOver = false
        score = 0
        resultMessage = ""
        keepScore = ["⬛️", "⬛️", "⬛️", "⬛️", "⬛️", "⬛️", "⬛️", "⬛️", "⬛️", "⬛️"]
        cpuChoice = items.randomElement() ?? ""
        
        winTowin = Bool.random()
        playerChoice  = items.randomElement() ?? ""
        playerChosePaper = false
        playerChoseRock = false
        playerChoseScissors = false
    }
        
    }

// MARK: - PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
