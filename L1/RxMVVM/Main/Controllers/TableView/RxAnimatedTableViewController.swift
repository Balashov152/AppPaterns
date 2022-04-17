//
//  RxAnimatedTableViewController.swift
//  RxMVVM
//
//  Created by Sergey Balashov on 26.03.2022.
//

import RxCocoa
import RxDataSources
import RxSwift
import UIKit

open class RxAnimatedTableViewController<ViewModel: RxViewModel & AnimatableViewModel>: RxTableController<ViewModel> {
    open var animationConfiguration: AnimationConfiguration {
        AnimationConfiguration(insertAnimation: .fade, reloadAnimation: .fade, deleteAnimation: .fade)
    }

    open lazy var dataSource = AnimatableDataSource<ViewModel.SectionModel>.TableView.animated(
        animationConfiguration: animationConfiguration
    )

    open var dataSourceBinding: Disposable?

    override open func setupBindings() {
        super.setupBindings()
        dataSourceBinding = viewModel.sections
            .asDriver()
            .drive(tableView.rx.items(dataSource: dataSource))
    }
}
