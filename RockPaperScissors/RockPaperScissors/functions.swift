//
//  functions.swift
//  RockPaperScissors
//
//  Created by 전민수 on 2022/04/18.
//

import Foundation

enum GameWinner {
    case usersVictory
    case computersVictory
    case tie
}

enum Rps: Int {
    case ready = 0
    case rock = 2
    case scissors = 1
    case paper = 3
}

func selectMenuByInput() -> String {
    print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
    guard let userInput = readLine() else { return "" }
    return userInput
}

func printGameResult(winner: GameWinner) {
    switch winner {
    case .usersVictory:
        print("이겼습니다!")
    case .computersVictory:
        print("졌습니다!")
    default:
        print("비겼습니다")
        startRPS()
    }
}

func convertInputToRps(input: String) -> Rps {
    var myRpsPick: Rps
    switch input {
    case "1":
        myRpsPick = Rps(rawValue: 1) ?? Rps.ready
    case "2":
        myRpsPick = Rps(rawValue: 2) ?? Rps.ready
    case "3":
        myRpsPick = Rps(rawValue: 3) ?? Rps.ready
    default:
        return Rps.ready
    }
    return myRpsPick
}

func startRPS() {
    let userMenuChoice = selectMenuByInput()
    decideProcessBy(userMenuChoice)
}

func pickOutWinner(RpsPicksOf: (user: Rps, computer: Rps)) -> GameWinner {
    if RpsPicksOf.computer == RpsPicksOf.user {
        return .tie
    }
    
    switch (RpsPicksOf.user, RpsPicksOf.computer) {
    case (.rock, .scissors), (.scissors, .paper), (.paper, .rock):
        return .usersVictory
    default:
        return .computersVictory
    }
}

func playRPS(menuChoice: String) -> (Rps, Rps) {
    let myRpsPick = convertInputToRps(input: menuChoice)
    guard let computerRpsPick = Rps(rawValue: Int.random(in: 1...3)) else { return (.ready, .ready) }
    
    return (myRpsPick, computerRpsPick)
}

func decideProcessBy(_ menuChoice: String) {
    
    switch menuChoice {
    case "0":
        print("게임 종료")
        return
    case "1", "2", "3":
        let pickResult: (Rps, Rps) = playRPS(menuChoice: menuChoice)
        let winner = pickOutWinner(RpsPicksOf: pickResult)
        printGameResult(winner: winner)
    default:
        print("잘못된 입력입니다. 다시 시도해주세요.")
        startRPS()
    }
}
