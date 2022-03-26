//
//  NotesViewController.swift
//  iOSPatterns
//
//  Created by Sergey Balashov on 26.03.2022.
//

import Foundation
import RxMVVM

class NotesViewController: RxReloadTableViewController<NotesViewModel> {
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(cell: NoteTableViewCell.self)
    }
}
