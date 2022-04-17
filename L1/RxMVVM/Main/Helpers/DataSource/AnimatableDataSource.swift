//
//  AnimatableDataSource.swift
//  RxMVVM
//
//  Created by Sergey Balashov on 26.03.2022.
//

import ConfigurableUI
import Foundation
import RxDataSources

public enum AnimatableDataSource<SectionModel: CustomAnimatableSectionModelType> {
    public enum TableView {
        static func animated(
            animationConfiguration: AnimationConfiguration? = nil
        ) -> RxTableViewSectionedAnimatedDataSource<SectionModel> {
            let animationConfiguration = animationConfiguration ?? AnimationConfiguration()

            return RxTableViewSectionedAnimatedDataSource<SectionModel>(
                animationConfiguration: animationConfiguration,
                configureCell: ConfigureViewModable<SectionModel>().configureCell
            )
        }
    }

    public enum CollectionView {
        public static func animated(
            animationConfiguration: AnimationConfiguration? = nil
        ) -> RxCollectionViewSectionedAnimatedDataSource<SectionModel> {
            let animationConfiguration = animationConfiguration ?? AnimationConfiguration()
            return RxCollectionViewSectionedAnimatedDataSource<SectionModel>(
                animationConfiguration: animationConfiguration,
                configureCell: ConfigureViewModable<SectionModel>().collectionConfigureCell
            )
        }
    }
}
