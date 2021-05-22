//
//  Set.swift
//  SportCountPoint
//
//  Created by Adrien PEREA on 22/05/2021.
//

import Foundation
import UIKit

enum Player {
    case one, two
}

class Set {
// MARK: - Properties
    var scores = [Player.one: 0, Player.two: 0]
    var winner: Player?
    var isOver: Bool {
        return winner != nil
    }

// MARK: - Methods
    func incrementScore(forPlayer player: Player) {
        scores[player]! += 1
        if scores[player]! >= 21 && isTwoPointAhead {
            end(withWinner: player)
        }
    }

    private var isTwoPointAhead: Bool {
        return abs(scores[.one]! - scores[.two]!) >= 2
        }

fileprivate func end(withWinner winner: Player) {
    self.winner = winner
}
}


