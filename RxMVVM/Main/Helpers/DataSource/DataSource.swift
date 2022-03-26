//
//  DataSource.swift
//  RxMVVM
//
//  Created by Sergey Balashov on 26.03.2022.
//

import Foundation
import RxDataSources
import ConfigurableUI

public enum DataSource<Section, Item: RowViewModel> {
    public enum TableView {
        public typealias TableViewSection = SectionModel<Section, Item>

        public static func reload() -> RxTableViewSectionedReloadDataSource<TableViewSection> {
            return RxTableViewSectionedReloadDataSource<TableViewSection>(configureCell: ConfigureViewModable<TableViewSection>().configureCell)
        }
    }

    public enum CollectionView {
        public typealias CollectionViewSection = SectionModel<Section, Item>

        public static func reload() -> RxCollectionViewSectionedReloadDataSource<CollectionViewSection> {
            return .init(configureCell: ConfigureViewModable<CollectionViewSection>().collectionConfigureCell)
        }
    }
}
