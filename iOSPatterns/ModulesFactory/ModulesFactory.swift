//
//  ModulesFactory.swift
//  iOSPatterns
//
//  Created by Sergey Balashov on 17.04.2022.
//

import PatternServices
import UIKit

protocol ModulesFactorable {
    func rootModule() -> UINavigationController

    func mvvmModule() -> NotesViewController<NotesViewModel>
    func mvpsuiModule(output: SUIMVPModuleOutput) -> (view: SUIMVPView, input: SUIMVPModuleInput)
}

struct ModulesFactory {
    private let serviceFactory: ServiceFactorable

    init(serviceFactory: ServiceFactorable) {
        self.serviceFactory = serviceFactory
    }
}

// MARK: - Module names

typealias SUIMVPModule = (view: SUIMVPView, input: SUIMVPModuleInput)

extension ModulesFactory: ModulesFactorable {
    func rootModule() -> UINavigationController {
        let mainViewController = RootViewController(modulesFactory: self)

        return UINavigationController(rootViewController: mainViewController)
    }

    func mvvmModule() -> NotesViewController<NotesViewModel> {
        let notesService = serviceFactory.notesServicable()
        let viewModel = NotesViewModel(notesService: notesService)
        return NotesViewController<NotesViewModel>(viewModel: viewModel)
    }
    
    func mvpsuiModule(output: SUIMVPModuleOutput) -> SUIMVPModule {
        let viewState = SUIMVPViewState()
        let presenter = SUIMVPPresenter(output: output, viewState: viewState)
        let view = SUIMVPView(output: presenter, state: viewState)
        
        return (view: view, input: presenter)
    }
}
