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

class RxAnimatedTableViewController<ViewModel: AnimatableViewModel>: RxTableController<ViewModel> {
    open var animationConfiguration: AnimationConfiguration {
        AnimationConfiguration(insertAnimation: .fade, reloadAnimation: .fade, deleteAnimation: .fade)
    }

    public lazy var dataSource = AnimatableDataSource<ViewModel.Section, ViewModel.Item>.TableView.animated(
        animationConfiguration: animationConfiguration
    )
    
    public var dataSourceBinding: Disposable?
    
    override func setupBindings() {
        super.setupBindings()
        dataSourceBinding = viewModel.sections.asDriver()
            .drive(tableView.rx.items(dataSource: dataSource))
    }
}
