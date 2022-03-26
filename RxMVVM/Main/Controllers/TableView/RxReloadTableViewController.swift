//
//  RxReloadTableViewController.swift
//  RxMVVM
//
//  Created by Sergey Balashov on 26.03.2022.
//

import RxCocoa
import RxDataSources
import RxSwift
import UIKit

class RxReloadTableViewController<ViewModel: ReloadViewModel>: RxTableController<ViewModel> {
    public var dataSource = DataSource<ViewModel.Section, ViewModel.Item>.TableView.reload()
    public var dataSourceBinding: Disposable?
    
    override func setupBindings() {
        super.setupBindings()
        dataSourceBinding = viewModel.sections.asDriver()
            .drive(tableView.rx.items(dataSource: dataSource))
    }
}
