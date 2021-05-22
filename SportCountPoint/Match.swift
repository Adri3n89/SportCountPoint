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
}
