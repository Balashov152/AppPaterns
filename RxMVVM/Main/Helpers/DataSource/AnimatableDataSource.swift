//
//  AnimatableDataSource.swift
//  RxMVVM
//
//  Created by Sergey Balashov on 26.03.2022.
//

import Foundation
import RxDataSources
import ConfigurableUI

public enum AnimatableDataSource<Section: IdentifiableType, Item: RowViewModel & IdentifiableType & Equatable> {
    public enum TableView {
        public typealias TableViewSection = AnimatableSectionModel<Section, Item>
        
        static func animated(
            animationConfiguration: AnimationConfiguration? = nil
        ) -> RxTableViewSectionedAnimatedDataSource<TableViewSection> {
            let animationConfiguration = animationConfiguration ?? AnimationConfiguration()
            
            return RxTableViewSectionedAnimatedDataSource<TableViewSection>(
                animationConfiguration: animationConfiguration,
                configureCell: ConfigureViewModable<TableViewSection>().configureCell
            )
        }
    }
    
    public struct CollectionView {
        public typealias CollectionViewSection = AnimatableSectionModel<Section, Item>
        
        public static func animated(
            animationConfiguration: AnimationConfiguration? = nil
        ) -> RxCollectionViewSectionedAnimatedDataSource<CollectionViewSection> {
            
            let animationConfiguration = animationConfiguration ?? AnimationConfiguration()
            return RxCollectionViewSectionedAnimatedDataSource<CollectionViewSection>(
                animationConfiguration: animationConfiguration,
                configureCell: ConfigureViewModable<CollectionViewSection>().collectionConfigureCell
            )
        }
    }
}
