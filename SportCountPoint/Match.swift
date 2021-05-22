//
//  Match.swift
//  SportCountPoint
//
//  Created by Adrien PEREA on 22/05/2021.
//

import Foundation

class Match {
    // MARK: - Properties
    var sets = [Set(), Set(), Set()]

    var winner: Player?

    var isOver: Bool {
        return winner != nil
    }

    var scores: [Player: Int] {
        return getScores()
    }

    private var currentSet: Set {
        return sets.last!
    }

    static let maxNumberOfWonSets = 2

    // MARK: - Private Getters
    
    private func getScores() -> [Player: Int] {
        var scores = [Player.one: 0, Player.two: 0]

        for set in sets {
            if let setWinner = set.winner {
                scores[setWinner]! += 1
            }
        }
        return scores
    }

}
