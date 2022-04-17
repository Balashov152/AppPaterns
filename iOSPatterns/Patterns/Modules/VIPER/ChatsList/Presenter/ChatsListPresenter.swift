//

import Combine
import Foundation
import PatternFoundation

final class ChatsListPresenter {

    // MARK: Dependencies

    private let interactor: ChatsListInteracting
    private let viewState: ChatsListViewState
    private let router: ChatsListOutput

    // MARK: Environment

    private var subscriptions = Set<AnyCancellable>()
    private let presenterState: ChatsListPresenterState

    // MARK: Init

    init(
        interactor: ChatsListInteracting,
        viewState: ChatsListViewState,
        router: ChatsListOutput,
        presenterState: ChatsListPresenterState = .init()
    ) {
        self.interactor = interactor
        self.viewState = viewState
        self.router = router
        self.presenterState = presenterState
    }
}

// MARK: - ChatsListViewOutput

extension ChatsListPresenter: ChatsListViewOutput {}

// MARK: - ChatsListInput

extension ChatsListPresenter: ChatsListInput {}

// MARK: - SystemHostingControllerDelegate

extension ChatsListPresenter: ViewCycleHandler {}

// MARK: - Private

private extension ChatsListPresenter {}
