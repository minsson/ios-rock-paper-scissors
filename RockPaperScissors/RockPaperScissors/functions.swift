//
//  functions.swift
//  RockPaperScissors
//
//  Created by 전민수 on 2022/04/18.
//

import Foundation

var menu: String = "가위(1), 바위(2), 보(3)! <종료 : 0> : "
var turn: String = ""

func selectMenuByInput() -> String {
    print(menu, terminator: "")
    guard let userInput = readLine() else { return "" }
    return userInput
}

func decideRSPProcessBy(_ menuChoice: String) {
    switch menuChoice {
    case "0":
        print("게임 종료")
    case "1", "2", "3":
        let eachPick: (Rps, Rps) = playRPS(by: menuChoice)
        let gameResult = pickOutWinner(from: eachPick)
        printRSPResult(basedOn: gameResult)
        
        restartIfTie(judgingBy: gameResult)
    default:
        print("잘못된 입력입니다. 다시 시도해주세요.")
        startRPS()
    }
}

func startRPS() {
    let userMenuChoice = selectMenuByInput()
    decideRSPProcessBy(userMenuChoice)
}

func convertInputToRps(input: String) -> Rps {
    guard let pickNumber = Int(input) else { return Rps.ready }
    let myRpsPick:Rps = Rps(rawValue: pickNumber) ?? Rps.ready

    return myRpsPick
}

func playRPS(by menuChoice: String) -> (Rps, Rps) {
    let myRpsPick = convertInputToRps(input: menuChoice)
    guard let computerRpsPick = Rps(rawValue: Int.random(in: 1...3)) else { return (.ready, .ready) }
    
    return (myRpsPick, computerRpsPick)
}

func pickOutWinner(from pickOf: (user: Rps, computer: Rps)) -> GameWinner {
    if pickOf.computer == pickOf.user {
        return .tie
    }
    
    switch (pickOf.user, pickOf.computer) {
    case (.rock, .scissors), (.scissors, .paper), (.paper, .rock):
        return .usersVictory
    default:
        return .computersVictory
    }
}

func printRSPResult(basedOn gameResult: GameWinner) {
    switch gameResult {
    case .usersVictory:
        print("이겼습니다!")
        turn = GameWinner.usersVictory.rawValue
    case .computersVictory:
        print("졌습니다!")
        turn = GameWinner.computersVictory.rawValue
    default:
        print("비겼습니다")
    }
}

func restartIfTie(judgingBy gameResult: GameWinner) {
    if gameResult == .tie {
        startRPS()
    } else {
        startMJB()
    }
}

func startMJB() {
    menu = "[\(turn) 턴] 묵(1), 찌(2), 빠(3)! <종료 : 0> : "
    let userMenuChoice = selectMenuByInput()
    decideMJBProcessBy(userMenuChoice)
}

func decideMJBProcessBy(_ menuChoice: String) {
    switch menuChoice {
    case "0":
        print("게임 종료")
    case "1", "2", "3":
        let eachPick: (Rps, Rps) = playRPS(by: menuChoice)
        let gameResult = pickOutWinner(from: eachPick)
        printMJBResult(basedOn: gameResult)
        
        endIfTie(judgingBy: gameResult)
    default:
        print("잘못된 입력입니다. 다시 시도해주세요.")
        turn = GameWinner.computersVictory.rawValue
        startMJB()
    }
}

func printMJBResult(basedOn gameResult: GameWinner) {
    switch gameResult {
    case .usersVictory:
        turn = GameWinner.usersVictory.rawValue
        print("\(turn)의 턴입니다!")

    case .computersVictory:
        turn = GameWinner.computersVictory.rawValue
        print("\(turn)의 턴입니다!")

    default:
        print("\(turn)의 승리!")
    }
}

func endIfTie(judgingBy gameResult: GameWinner) {
    if gameResult == .tie {
    } else {
        startMJB()
    }
}
