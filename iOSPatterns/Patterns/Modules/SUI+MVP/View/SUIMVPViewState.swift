//
//  SUIMVPViewState.swift
//  iOSPatterns
//
//  Created by Sergey Balashov on 27.05.2022.
//

import Combine
import SwiftUI

class SUIMVPViewState: ObservableObject {
    @Published var viewIndex: Int = 0
}
