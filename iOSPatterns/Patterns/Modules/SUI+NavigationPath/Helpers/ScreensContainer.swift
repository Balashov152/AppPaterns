//
//  ScreensContainer.swift
//  iOSPatterns
//
//  Created by Sergey Balashov on 24.04.2023.
//

import Foundation

protocol ScreensContainer: Hashable {}

extension ScreensContainer {
    func hash(into hasher: inout Hasher) {
        hasher.combine("\(self)")
    }
    
    static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.hashValue == rhs.hashValue
    }
}
