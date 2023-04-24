//
//  SUIMVPPresenter.swift
//  iOSPatterns
//
//  Created by Sergey Balashov on 27.05.2022.
//

import Foundation

class SUIMVPPresenter {
    // MARK: Any DI
    // ...
    
    // Property for manage view
    private let viewState: SUIMVPViewState
    
    // Router output, usually coordinator
    private weak var output: SUIMVPModuleOutput?
    
    // Two most important propery output and viewState
    init(output: SUIMVPModuleOutput, viewState: SUIMVPViewState) {
        self.output = output
        self.viewState = viewState
    }
    
    deinit {
        print("deinit SUIMVPPresenter")
    }
}

// MARK: - SUIMVPModuleInput
// Any updates from other modules or coordinator

extension SUIMVPPresenter: SUIMVPModuleInput {
    func updateViewIndex(int: Int) {
        viewState.viewIndex = int
    }
}

// MARK: - SUIMVPViewOutput
// Any updates from view or user actions

extension SUIMVPPresenter: SUIMVPViewOutput {
    func viewDidRequestNextView() {
        output?.moduleDidFinishWork(with: viewState.viewIndex)
    }
    
    func viewDidRequestUpdateIndex() {
        viewState.viewIndex += 1
    }
}

// MARK: - Private
// Any private logic

private extension SUIMVPPresenter {    
    func openNextScreen() {
        output?.moduleDidFinishWork(with: viewState.viewIndex)
    }
}
