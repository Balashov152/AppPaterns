//
//  MVPSUIViewState.swift
//  iOSPatterns
//
//  Created by Sergey Balashov on 27.05.2022.
//

import Combine
import SwiftUI

struct TextModel: Hashable {
    let text: String
    let color: Color
}

class MVPSUIViewState: ObservableObject {
    @Published var viewIndex: Int = 0
    
    @Published var viewModels: [TextModel] = []
}
