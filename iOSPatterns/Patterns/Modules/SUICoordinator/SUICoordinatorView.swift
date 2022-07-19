//
//  SUICoordinatorView.swift
//  iOSPatterns
//
//  Created by Sergey Balashov on 19.07.2022.
//

import Foundation
import SwiftUI
import PatternFoundation

struct SUICoordinatorView: View {
    @ObservedObject private var object: SUICoordinatorObject
    
    init(object: SUICoordinatorObject) {
        self.object = object
    }
    
    var body: some View {
        rootView
    }
    
    @ViewBuilder private var rootView: some View {
        if let rootView = object.rootView {
            rootView.view
                .navigation(item: $object.secondView) { $0.view }
        }
    }
}
