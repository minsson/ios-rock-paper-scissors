//
//  sookoong.swift
//  RockPaperScissors
//
//  Created by Minseong Kang on 2022/04/19.
//

import Foundation




enum RPS: Int {
    case scissors = 1
    case rock = 2
    case paper = 3
    case error = 999
}











func selectMenuByInput() -> String {
    print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
    guard let userInput = readLine() else { return "" }
    return userInput
}

func printGameResult(_ winner: String) {
    switch winner {
    case "사용자":
        print("이겼습니다!")
        print("게임 종료")
    case "컴퓨터":
        print("졌습니다!")
        print("게임 종료")
    default:
        print("비겼습니다!")
        startRPS()
    }
}

func startRPS() {
    let userMenuChoice = selectMenuByInput()
    decideProcessBy(userMenuChoice)
}


func pickOutWinner(userInput: String) -> String {
    var winner: String
    let randomChoice = RPS(rawValue: Int.random(in: 1...3))
    let choiceOfComputer = randomChoice ?? RPS.error
    
    let scissors = "1"
    let rock = "2"
    let paper = "3"
   
    let both: (RPS, String) = (choiceOfComputer, userInput)
    
    switch both {
    case (RPS.scissors, scissors), (RPS.rock, rock), (RPS.paper, paper):
        winner = "무승부"
    case (RPS.scissors, rock), (RPS.rock, paper), (RPS.paper, scissors):
        winner = "사용자"
    default:
        winner = "컴퓨터"
    }
    return winner
}






func decideProcessBy(_ choice: String) {
    switch choice {
    case "0":
        print("게임 종료")
    case "1", "2", "3":
        let winner = pickOutWinner(userInput: choice)
        printGameResult(winner)
    default:
        print("잘못된 입력입니다. 다시 시도해주세요.")
        startRPS()
    }
}





