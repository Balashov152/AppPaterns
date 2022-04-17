//
//  RxTableController.swift
//  RxMVVM
//
//  Created by Sergey Balashov on 26.03.2022.
//

import RxCocoa
import RxDataSources
import RxSwift
import UIKit

open class RxTableController<ViewModel: RxViewModel>: RxViewController<ViewModel> {
    open var tableViewStyle: UITableView.Style { .plain }

    open lazy var refreshControl: UIRefreshControl = {
        let control = UIRefreshControl()
        tableView.refreshControl = control
        return control
    }()

    open lazy var tableView: UITableView = {
        let tableView = UITableView(frame: view.frame, style: tableViewStyle)
        tableView.tableFooterView = UIView()
        tableView.keyboardDismissMode = .interactive
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 100
        tableView.backgroundColor = .white
        return tableView
    }()

    override open func loadView() {
        super.loadView()
        view = tableView
    }
}
