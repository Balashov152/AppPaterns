//
//  MVPSUIPresenter.swift
//  iOSPatterns
//
//  Created by Sergey Balashov on 27.05.2022.
//

import Foundation

class MVPSUIPresenter {
    // MARK: Any DI
    // ...
    
    // Property for manage view
    private let viewState: MVPSUIViewState
    
    // Router output, usually coordinator
    private weak var output: MVPSUIOutput?
    
    // Two most important propery output and viewState
    init(output: MVPSUIOutput, viewState: MVPSUIViewState) {
        self.output = output
        self.viewState = viewState
    }
    
    deinit {
        print("deinit MVPSUIPresenter")
    }
}

// MARK: - MVPSUIInput
// Any updates from other modules or coordinator

extension MVPSUIPresenter: MVPSUIInput {
    func updateViewIndex(int: Int) {
        viewState.viewIndex = int
    }
}

// MARK: - MVPSUIViewOutput
// Any updates from view or user actions

extension MVPSUIPresenter: MVPSUIViewOutput {
    func viewDidRequestNextView() {
        output?.moduleDidFinishWork(with: viewState.viewIndex)
    }
    
    func viewDidRequestUpdateIndex() {
        viewState.viewIndex += 1
    }
}

// MARK: - Private
// Any private logic

private extension MVPSUIPresenter {
    func openNextScreen() {
        output?.moduleDidFinishWork(with: viewState.viewIndex)
    }
}
