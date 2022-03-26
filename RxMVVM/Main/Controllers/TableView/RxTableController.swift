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

class RxTableController<ViewModel>: RxViewController<ViewModel> {
    open var tableViewStyle: UITableView.Style { .plain }
    
    lazy var refreshControl: UIRefreshControl = {
        let control = UIRefreshControl()
        tableView.refreshControl = control
        return control
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: view.frame, style: tableViewStyle)
        tableView.tableFooterView = UIView()
        tableView.keyboardDismissMode = .interactive
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 100
        tableView.showsVerticalScrollIndicator = false
        tableView.backgroundColor = .white
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        tableView.separatorStyle = .none
        return tableView
    }()

    override func loadView() {
        super.loadView()
        view = tableView
    }
}
