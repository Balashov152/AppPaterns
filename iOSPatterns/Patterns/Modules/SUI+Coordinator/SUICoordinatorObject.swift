//
//  SUICoordinatorObject.swift
//  iOSPatterns
//
//  Created by Sergey Balashov on 27.05.2022.
//

import SwiftUI
import PatternFoundation

class SUICoordinatorObject: ObservableObject {
    private let modulesFactory: ModulesFactorable
    
    @Published var rootView: BaseCoordinatorView<SUIMVPView, SUIMVPModuleInput>?
    @Published var secondView: BaseCoordinatorView<SUIMVPView, SUIMVPModuleInput>?
    
    init(modulesFactory: ModulesFactorable) {
        self.modulesFactory = modulesFactory
    }
    
    func start() {
        let (view, input) = modulesFactory.mvpsuiModule(output: self)
        self.rootView = BaseCoordinatorView(view: view, input: input)
    }
}

// MARK: - SUIMVPModuleOutput

extension SUICoordinatorObject: SUIMVPModuleOutput {
    func moduleDidFinishWork(with index: Int) {
        let (view, input) = modulesFactory.mvpsuiModule(output: self)
        // Any updates view before show
        input.updateViewIndex(int: index)
        
        secondView = BaseCoordinatorView(view: view, input: input)
    }
}
