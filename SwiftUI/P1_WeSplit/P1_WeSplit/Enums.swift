//
//  Enums.swift
//  P1_WeSplit
//
//  Created by Sophia Lu on 6/24/21.
//

import Foundation

enum Flavor: String, CaseIterable, Identifiable {
    case chocolate
    case vanilla
    case strawberry

    var id: String { self.rawValue }
}
