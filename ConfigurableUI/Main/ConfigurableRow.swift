//
//  ConfigurableRow.swift
//  RxMVVM
//
//  Created by Sergey Balashov on 26.03.2022.
//

import UIKit

/// Протокол для каждой ячейки которая хочет,
/// что бы ее настраивала абстрактная `ViewModel` из все
public protocol ConfigurableRow: IdentifiableView {
    associatedtype ViewModel: RowViewModel

    func configure(viewModel: ViewModel)
}
