//
//  DataSource.swift
//  RxMVVM
//
//  Created by Sergey Balashov on 26.03.2022.
//

import Foundation
import RxDataSources
import ConfigurableUI

public enum DataSource<SectionModel: CustomSectionModelType> {
    public enum TableView {
        public static func reload() -> RxTableViewSectionedReloadDataSource<SectionModel> {
            return RxTableViewSectionedReloadDataSource<SectionModel>(configureCell: ConfigureViewModable<SectionModel>().configureCell)
        }
    }

    public enum CollectionView {
        public static func reload() -> RxCollectionViewSectionedReloadDataSource<SectionModel> {
            return .init(configureCell: ConfigureViewModable<SectionModel>().collectionConfigureCell)
        }
    }
}


