//
//   RowViewModel.swift
//  RxMVVM
//
//  Created by Sergey Balashov on 26.03.2022.
//

import Foundation

public protocol RowViewModel {
    associatedtype Cell: ConfigurableRow

    var cellType: Cell.Type { get }
}

/// Разширение для `RowViewModelV2` что бы в модели можно было только проставить `typealias Cell`
/// А проперти отработает сама
public extension RowViewModel {
    var cellType: Cell.Type { Cell.self }
}
