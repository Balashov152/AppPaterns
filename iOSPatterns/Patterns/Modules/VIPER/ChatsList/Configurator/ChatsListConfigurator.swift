//

import PatternFoundation

final class ChatsListConfigurator {
    func configure(router: ChatsListOutput) -> PatternHostingController<ChatsListView> {
        let viewState = ChatsListViewState()
        
        let interactor = ChatsListInteractor()
        
        let presenter = ChatsListPresenter(
            interactor: interactor,
            viewState: viewState,
            router: router
        )
        
        let view = ChatsListView(output: presenter, state: viewState)
        
        let controller = PatternHostingController(rootView: view)
        controller.cycleHandler = presenter
        
        return controller
    }
}
