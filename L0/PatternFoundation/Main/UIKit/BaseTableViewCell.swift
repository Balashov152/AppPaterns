//
//  BaseTableViewCell.swift
//  PatternFoundation
//
//  Created by Sergey Balashov on 26.03.2022.
//

import Foundation
import UIKit

open class BaseTableViewCell: UITableViewCell {
    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setupUI()
    }

    @available(*, unavailable)
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open func setupUI() {}
}
