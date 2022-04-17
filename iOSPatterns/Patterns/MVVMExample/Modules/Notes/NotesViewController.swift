//
//  NotesViewController.swift
//  iOSPatterns
//
//  Created by Sergey Balashov on 26.03.2022.
//

import Foundation
import RxMVVM
import UIKit

class NotesViewController<ViewModel: NotesViewModelInterface>: RxAnimatedTableViewController<ViewModel> {
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(cell: NoteTableViewCell.self)

        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .refresh,
            target: self,
            action: #selector(refreshTap)
        )
    }

    @objc private func refreshTap() {
        viewModel.shakeData()
    }
}
