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
}

struct ModulesFactory {
    private let serviceFactory: ServiceFactorable

    init(serviceFactory: ServiceFactorable) {
        self.serviceFactory = serviceFactory
    }
}

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
}
