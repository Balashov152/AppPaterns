//
//  BaseCoordinatorView.swift
//  PatternFoundation
//
//  Created by Sergey Balashov on 19.07.2022.
//

import SwiftUI

open class BaseCoordinatorView<View: SwiftUI.View, Input>: Identifiable {
    public let view: View
    public let input: Input
    
    public init(view: View, input: Input) {
        self.view = view
        self.input = input
    }
}
