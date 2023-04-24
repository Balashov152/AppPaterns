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
    func mvpsuiModule(output: MVPSUIModuleOutput) -> (view: MVPSUIView, input: MVPSUIModuleInput)
}

struct ModulesFactory {
    private let serviceFactory: ServiceFactorable

    init(serviceFactory: ServiceFactorable) {
        self.serviceFactory = serviceFactory
    }
}

// MARK: - Module names

typealias MVPSUIModule = (view: MVPSUIView, input: MVPSUIModuleInput)

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
    
    func mvpsuiModule(output: MVPSUIModuleOutput) -> MVPSUIModule {
        let viewState = MVPSUIViewState()
        let presenter = MVPSUIPresenter(output: output, viewState: viewState)
        let view = MVPSUIView(output: presenter, state: viewState)
        
        return (view: view, input: presenter)
    }
}
