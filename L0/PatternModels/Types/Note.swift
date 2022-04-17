//
//  Note.swift
//  iOSPatterns
//
//  Created by Sergey Balashov on 26.03.2022.
//

import Foundation

public struct Note: Equatable {
    public let text: String
    public let date: Date

    public init(text: String, date: Date) {
        self.text = text
        self.date = date
    }
}
