//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

enum StartAndEndMessage {
    static let startOfGame = "가위(1), 바위(2), 보(3)! <종료 : 0>"
    static let endOfGame = "게임 종료"
}

enum ErrorMessage {
    static let wrongInput = "잘못된 입력입니다. 다시 시도해주세요."
}

enum GameResultMessage {
    static let win = "이겼습니다!\n게임 종료"
    static let defeat = "졌습니다!\n게임 종료"
    static let draw = "비겼습니다!"
}

enum PunctuationMarks {
    static let colon = " : "
    static let emptyString = ""
}

enum DecisionNumber {
    static let winNumber = [1, -2]
    static let defeatNumber = [2, -1]
}

func selectGameMenu() -> String {
    print(StartAndEndMessage.startOfGame, terminator: PunctuationMarks.colon)
    guard let userInput = readLine() else { return PunctuationMarks.emptyString }
    return userInput
}

func checkValidity(_ userInput: String) -> Int? {
    let validNumbersForGame = ["0", "1", "2", "3"]
    if validNumbersForGame.contains(userInput) {
        guard let intUserInput = Int(userInput) else { return nil }
        return intUserInput
    } else {
        print(ErrorMessage.wrongInput)
        startGame(selectGameMenu())
        return nil
    }
}

func startGame(_ userInput: String) {
    let endingNumber = 0
    guard let validNumber = checkValidity(userInput) else { return }
    if validNumber == endingNumber {
        print(StartAndEndMessage.endOfGame)
        return
    } else {
        decideWinner(validNumber)
    }
}

func decideWinner(_ validNumber: Int) -> String {
    let allowedNumberRange: ClosedRange<Int> = 1...3
    let computerNumber = Int.random(in: allowedNumberRange)
    let numberToDecideWinner: Int = validNumber - computerNumber
    var initialTurn: String = ""
    switch numberToDecideWinner {
    case DecisionNumber.winNumber[0], DecisionNumber.winNumber[1]:
        print(GameResultMessage.win)
        initialTurn = "사용자"
    case DecisionNumber.defeatNumber[0], DecisionNumber.defeatNumber[1]:
        print(GameResultMessage.defeat)
        initialTurn = "컴퓨터"
    default:
        print(GameResultMessage.draw)
        startGame(selectGameMenu())
    }
    return initialTurn
}

startGame(selectGameMenu())
