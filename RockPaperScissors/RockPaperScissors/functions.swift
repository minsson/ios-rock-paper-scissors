//
//  functions.swift
//  RockPaperScissors
//
//  Created by 전민수 on 2022/04/18.
//

import Foundation

let rpsMenu: String = "가위(1), 바위(2), 보(3)! <종료 : 0> : "
var mjbMenu: String = "[\(turn) 턴] 묵(1), 찌(2), 빠(3)! <종료 : 0> : "

func selectMenuByInput(menu: String) -> String {
    print(menu, terminator: "")
    guard let userInput = readLine() else { return "" }
    return userInput
}

func decideProcessBy(_ menuChoice: String) {
    switch menuChoice {
    case "0":
        print("게임 종료")
    case "1", "2", "3":
        let eachPick: (Rps, Rps) = playRPS(by: menuChoice)
        print(eachPick)
        let gameResult = pickOutWinner(from: eachPick)
        print(gameResult)
        printResult(basedOn: gameResult)
        
        restartIfTie(judgingBy: gameResult)
    default:
        print("잘못된 입력입니다. 다시 시도해주세요.")
        startRPS()
    }
}

func startRPS() {
    let userMenuChoice = selectMenuByInput(menu: rpsMenu)
    decideProcessBy(userMenuChoice)
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

func printResult(basedOn gameResult: GameWinner) {
    switch gameResult {
    case .usersVictory:
        turn = "사용자"
        print("이겼습니다!")

    case .computersVictory:
        turn = "컴퓨터"
        print("졌습니다!")

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
    let userMenuChoice = selectMenuByInput(menu: mjbMenu)
    print(turn)
    decideProcessBy2(userMenuChoice)
}

var turn: String = ""

func decideProcessBy2(_ menuChoice: String) {
    switch menuChoice {
    case "0":
        print("게임 종료")
    case "1", "2", "3":
        let eachPick: (Rps, Rps) = playRPS(by: menuChoice)
        print(eachPick)
        let gameResult2 = pickOutWinner(from: eachPick)
        print(gameResult2)
        printResult2(basedOn: gameResult2)
        
        endIfTie(judgingBy: gameResult2)
    default:
        print("잘못된 입력입니다. 다시 시도해주세요.")
        turn = "컴퓨터"
        startMJB()
    }
}

//********************************
func printResult2(basedOn gameResult2: GameWinner) {
    switch gameResult2 {
    case .usersVictory:
        turn = "사용자"
        print("\(turn)의 턴입니다")

    case .computersVictory:
        turn = "컴퓨터"
        print("\(turn)의 턴입니다")

    default:
        print("\(turn)의 승리!")
    }
}

func endIfTie(judgingBy gameResult2: GameWinner) {
    if gameResult2 == .tie {
    } else {
        startMJB()
    }
}

//********************************
//func convertInputToRps(input: String) -> Rps {
//    guard let pickNumber = Int(input) else { return Rps.ready }
//    let myRpsPick:Rps = Rps(rawValue: pickNumber) ?? Rps.ready
//
//    return myRpsPick
//}

//********************************
//func playRPS(by menuChoice: String) -> (Rps, Rps) {
//    let myRpsPick = convertInputToRps(input: menuChoice)
//    guard let computerRpsPick = Rps(rawValue: Int.random(in: 1...3)) else { return (.ready, .ready) }
//
//    return (myRpsPick, computerRpsPick)
//}

//********************************
//func pickOutWinner(from pickOf: (user: Rps, computer: Rps)) -> GameWinner {
//    if pickOf.computer == pickOf.user {
//        return .tie
//    }
//
//    switch (pickOf.user, pickOf.computer) {
//    case (.rock, .scissors), (.scissors, .paper), (.paper, .rock):
//        return .usersVictory
//    default:
//        return .computersVictory
//    }
//}
