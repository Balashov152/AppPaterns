//
//  RxReloadTableViewController.swift
//  RxMVVM
//
//  Created by Sergey Balashov on 26.03.2022.
//

import RxCocoa
import RxSwift
import UIKit

open class RxReloadTableViewController<ViewModel: RxViewModel & ReloadViewModel>: RxTableController<ViewModel> {
    open var dataSource = DataSource<ViewModel.SectionModel>.TableView.reload()
    open var dataSourceBinding: Disposable?

    override open func setupBindings() {
        super.setupBindings()
        dataSourceBinding = viewModel.sections
            .asDriver()
            .drive(tableView.rx.items(dataSource: dataSource))
    }
}
