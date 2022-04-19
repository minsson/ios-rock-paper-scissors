//
//  enums.swift
//  RockPaperScissors
//
//  Created by 전민수 on 2022/04/19.
//

import Foundation

enum Rps: Int {
    case ready = 0
    case scissors = 1
    case rock = 2
    case paper = 3
}

enum GameWinner: String {
    case usersVictory = "사용자"
    case computersVictory = "컴퓨터"
    case tie
}

enum Mjb: Int {
    case ready = 0
    case mookk = 1
    case jji = 2
    case bba = 3
}
