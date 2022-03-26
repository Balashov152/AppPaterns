//
//  NoteTableViewCell.swift
//  iOSPatterns
//
//  Created by Sergey Balashov on 26.03.2022.
//

import Foundation
import UIKit
import SnapKit
import ConfigurableUI
import PatternFoundation

struct NoteTableViewCellViewModel: RowViewModel {
    typealias Cell = NoteTableViewCell
    
    let text: String
}

class NoteTableViewCell: BaseTableViewCell {
    lazy var label: UILabel = {
        let label = UILabel()
        // Any customize here
        return label
    }()
    
    override func setupUI() {
        contentView.addSubview(label)
        label.snp.makeConstraints { make in
            make.left.top.equalToSuperview().offset(16)
            make.bottom.right.equalToSuperview().offset(-16)
        }
    }
}

extension NoteTableViewCell: ConfigurableRow {
    func configure(viewModel: NoteTableViewCellViewModel) {
        label.text = viewModel.text
    }
}
