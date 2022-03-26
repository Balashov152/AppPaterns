//
//  UICollectionView+.swift
//  ConfigurableUI
//
//  Created by Sergey Balashov on 26.03.2022.
//

import UIKit

public extension UICollectionView {
    /// Регистрация ячейки по с уникальному `identifier`
    func register<T: IdentifiableView>(cell: T.Type) {
        register(cell.self, forCellWithReuseIdentifier: cell.identifier)
    }

    /// Ячейка по `identifier`, который был зарегитсрирован
    func dequeueReusableCell<T>(_ type: T.Type, for indexPath: IndexPath) -> T where T: IdentifiableView {
        dequeueReusableCell(withReuseIdentifier: type.identifier, for: indexPath) as! T
    }
    
    func dequeueConfigurableCell<T: RowViewModel>(viewModel: T, for indexPath: IndexPath) -> some ConfigurableRow {
        let cell = dequeueReusableCell(viewModel.cellType, for: indexPath)

        if let viewModel = viewModel as? T.Cell.ViewModel {
            cell.configure(viewModel: viewModel)
        }

        return cell
    }
}
