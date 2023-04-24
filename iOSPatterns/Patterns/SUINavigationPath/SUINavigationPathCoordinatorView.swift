//
//  SUINavigationPathCoordinatorView.swift
//  iOSPatterns
//
//  Created by Sergey Balashov on 24.04.2023.
//

import Foundation
import SwiftUI

@available(iOS 16.0, *)
struct SUINavigationPathCoordinatorView: View {
    @ObservedObject private var object: SUINavigationPathCoordinatorObject
    
    init(object: SUINavigationPathCoordinatorObject) {
        self.object = object
    }
    
    var body: some View {
        NavigationStack(path: $object.path) { rootView }
    }
    
    @ViewBuilder private var rootView: some View {
        if let rootView = object.rootView {
            object.rootView?.view
                .navigationDestination(for: SUINavigationPathCoordinatorObject.ScreenType.self) { destination in
                    switch destination {
                    case .first(let module):
                        module.view
                    }
                }
        }
    }
}
