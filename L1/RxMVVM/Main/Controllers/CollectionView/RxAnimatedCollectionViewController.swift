//
//  RxAnimatedCollectionViewController.swift
//  RxMVVM
//
//  Created by Sergey Balashov on 26.03.2022.
//

import RxDataSources
import RxSwift
import UIKit

public class RxAnimatedCollectionViewController<ViewModel: RxViewModel & AnimatableViewModel>: RxCollectionViewController<ViewModel> {
    open var animationConfiguration: AnimationConfiguration {
        AnimationConfiguration(insertAnimation: .fade, reloadAnimation: .fade, deleteAnimation: .fade)
    }

    public lazy var dataSource = AnimatableDataSource<ViewModel.SectionModel>.CollectionView.animated(
        animationConfiguration: animationConfiguration
    )
    
    public var dataSourceBinding: Disposable?

    public override func setupBindings() {
        super.setupBindings()
        dataSourceBinding = viewModel.sections
            .asDriver(onErrorJustReturn: [])
            .drive(collectionView.rx.items(dataSource: dataSource))
    }
}
