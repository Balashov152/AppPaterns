//
//  MVPSUIViewState.swift
//  iOSPatterns
//
//  Created by Sergey Balashov on 27.05.2022.
//

import Combine
import SwiftUI

class MVPSUIViewState: ObservableObject {
    @Published var viewIndex: Int = 0
}
