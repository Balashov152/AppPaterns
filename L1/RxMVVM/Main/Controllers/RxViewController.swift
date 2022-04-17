//
//  RxViewController.swift
//  RxMVVM
//
//  Created by Sergey Balashov on 26.03.2022.
//

import PatternFoundation
import RxSwift
import UIKit

public typealias RxViewModel = ViewCycleHandler

open class RxViewController<ViewModel: RxViewModel>: UIViewController {
    public let viewModel: ViewModel

    public init(viewModel: ViewModel) {
        self.viewModel = viewModel

        super.init(nibName: nil, bundle: nil)

        debugPrint("init", type(of: self))
    }

    override init(nibName _: String?, bundle _: Bundle?) {
        fatalError("init(nibName:,bundle:) has not been implemented")
    }

    @available(*, unavailable)
    public required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    deinit {
        debugPrint("deinit", type(of: self))
    }

    override open func loadView() {
        super.loadView()
        view.backgroundColor = .white
    }

    override open func viewDidLoad() {
        super.viewDidLoad()
        viewModel.viewDidLoad()

        setupBindings()
    }

    override open func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.viewWillAppear(animated)
    }

    override open func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewModel.viewDidAppear(animated)
    }

    override open func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        viewModel.viewWillDisappear(animated)
    }

    override open func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        viewModel.viewDidDisappear(animated)
    }

    open func setupBindings() {}
}
