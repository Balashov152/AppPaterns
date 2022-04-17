//
//  ConfigureViewModable.swift
//  RxMVVM
//
//  Created by Sergey Balashov on 26.03.2022.
//

import ConfigurableUI
import RxDataSources
import UIKit

public struct ConfigureViewModable<Section: SectionModelType> where Section.Item: RowViewModel {
    public init() {}

    public typealias TableViewConfigureCell = (TableViewSectionedDataSource<Section>, UITableView, IndexPath, Section.Item) -> UITableViewCell

    public let configureCell: TableViewConfigureCell = { _, tableView, indexPath, viewModel -> UITableViewCell in
        let cell = tableView.dequeueConfigurableCell(viewModel: viewModel, for: indexPath)

        if let cell = cell as? UITableViewCell {
            return cell
        }

        assertionFailure("ConfigurableCell is not a UITableViewCell")
        return UITableViewCell()
    }

    public typealias CollecitonConfigureCell = (CollectionViewSectionedDataSource<Section>, UICollectionView, IndexPath, Section.Item) -> UICollectionViewCell

    public let collectionConfigureCell: CollecitonConfigureCell = { _, collectionView, indexPath, item -> UICollectionViewCell in
        let cell = collectionView.dequeueConfigurableCell(viewModel: item, for: indexPath)

        if let cell = cell as? UICollectionViewCell {
            return cell
        }

        assertionFailure("ConfigurableCell is not a UICollectionViewCell")
        return UICollectionViewCell()
    }
}
