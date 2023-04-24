//
//  SUINavigationPathCoordinatorObject.swift
//  iOSPatterns
//
//  Created by Sergey Balashov on 24.04.2023.
//

import Foundation
import SwiftUI
import PatternFoundation

@available(iOS 16.0, *)
class SUINavigationPathCoordinatorObject: ObservableObject {
    @Published var path: NavigationPath = .init()
    @Published var rootView: BaseCoordinatorView<SUIMVPView, SUIMVPModuleInput>?
    
    private let modulesFactory: ModulesFactorable

    init(modulesFactory: ModulesFactorable) {
        self.modulesFactory = modulesFactory
    }
    
    func start() {
        let (view, input) = modulesFactory.mvpsuiModule(output: self)
        self.rootView = BaseCoordinatorView(view: view, input: input)
    }
}

@available(iOS 16.0, *)
extension SUINavigationPathCoordinatorObject {
    enum ScreenType: ScreensContainer {
        case first(SUIMVPModule)
    }
}

@available(iOS 16.0, *)
extension SUINavigationPathCoordinatorObject: SUIMVPModuleOutput {
    func moduleDidFinishWork(with index: Int) {
        let module = modulesFactory.mvpsuiModule(output: self)
        module.input.updateViewIndex(int: index)
        path.append(ScreenType.first(module))
    }
}
