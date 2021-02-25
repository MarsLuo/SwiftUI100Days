//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Yang Dev Luo on 2021/2/24.
//

import SwiftUI

enum GameInput: Int {
    case rock = 0
    case paper = 1
    case scissors = 2
}

extension GameInput {
    static func isWinPair(your: GameInput, computer: GameInput) -> Bool {
        let winPairs: [[GameInput]] = [[.rock, .scissors], [.paper, .rock], [.scissors, .paper]];
        return winPairs.contains([your, computer])
    }
    
    static func random() -> GameInput {
        return GameInput(rawValue: Int.random(in: 0...2)) ?? .rock
    }
    
    static func create(rowValue:Int) -> GameInput {
        return GameInput(rawValue: rowValue) ?? .rock
    }
    
    var name:String {
        switch self {
        case .rock:
            return "Rock"
        case .paper:
            return "Paper"
        case .scissors:
            return "Scissors"
        default:
            return "Rock"
        }
    }
}

struct ContentView: View {
    
    var choiceList: [GameInput] = [.rock, .paper, .scissors]
    
    @State private var computerChoice = GameInput.rock
    @State private var youNeedWin = Bool.random()
    
    @State private var yourPoint = 0
    
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [.orange, .yellow]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            VStack{
                Text("Computer : \(self.computerChoice.name)")
                    .foregroundColor(.blue)
                    .bold()
                    .font(.title)
                Text("You need : \(youNeedWin ? "Win" : "Loss")")
                    .foregroundColor(.blue)
                    .bold()
                    .font(.title)
                Spacer()
                ForEach(0 ..< choiceList.count) { index in
                    Button(action: {
                        judgeWin(computerInput: computerChoice, yourInput: GameInput.create(rowValue: index))
                    }, label: {
                        Text("\(choiceList[index].name)")
                            .bold()
                            .padding()
                    })
                }
                Spacer()
                Text("Your Point: \(yourPoint)")
            }
        }
    }
    
    func judgeWin(computerInput: GameInput, yourInput: GameInput) {
        // win
        if GameInput.isWinPair(your: yourInput, computer: computerInput) {
            yourPoint += 1
        }
        nextLevel()
    }
    
    func nextLevel() {
        computerChoice = GameInput.random()
        youNeedWin = Bool.random()
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
