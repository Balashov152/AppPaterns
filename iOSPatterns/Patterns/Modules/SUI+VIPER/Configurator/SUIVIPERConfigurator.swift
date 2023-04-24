//

import PatternFoundation

final class SUIVIPERConfigurator {
    func configure(router: SUIVIPEROutput) -> PatternHostingController<SUIVIPERView> {
        let viewState = SUIVIPERViewState()
        
        let interactor = SUIVIPERInteractor()
        
        let presenter = SUIVIPERPresenter(
            interactor: interactor,
            viewState: viewState,
            router: router
        )
        
        let view = SUIVIPERView(output: presenter, state: viewState)
        
        let controller = PatternHostingController(rootView: view)
        controller.cycleHandler = presenter
        
        return controller
    }
}
