//
//  BaseTableViewCell.swift
//  PatternFoundation
//
//  Created by Sergey Balashov on 26.03.2022.
//

import Foundation
import UIKit

open class BaseTableViewCell: UITableViewCell {
    override public init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setupUI()
    }

    @available(*, unavailable)
    public required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    open func setupUI() {}
}
