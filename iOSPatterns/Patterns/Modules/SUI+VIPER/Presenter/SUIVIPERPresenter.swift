//

import Combine
import Foundation
import PatternFoundation

final class SUIVIPERPresenter {

    // MARK: Dependencies

    private let interactor: SUIVIPERInteracting
    private let viewState: SUIVIPERViewState
    private let router: SUIVIPEROutput

    // MARK: Environment

    private var subscriptions = Set<AnyCancellable>()
    private let presenterState: SUIVIPERPresenterState

    // MARK: Init

    init(
        interactor: SUIVIPERInteracting,
        viewState: SUIVIPERViewState,
        router: SUIVIPEROutput,
        presenterState: SUIVIPERPresenterState = .init()
    ) {
        self.interactor = interactor
        self.viewState = viewState
        self.router = router
        self.presenterState = presenterState
    }
}

// MARK: - SUIVIPERViewOutput

extension SUIVIPERPresenter: SUIVIPERViewOutput {}

// MARK: - SUIVIPERInput

extension SUIVIPERPresenter: SUIVIPERInput {}

// MARK: - SystemHostingControllerDelegate

extension SUIVIPERPresenter: ViewCycleHandler {}

// MARK: - Private

private extension SUIVIPERPresenter {}
