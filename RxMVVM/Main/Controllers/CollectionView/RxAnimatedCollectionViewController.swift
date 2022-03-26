//
//  RxAnimatedCollectionViewController.swift
//  RxMVVM
//
//  Created by Sergey Balashov on 26.03.2022.
//

import RxDataSources
import RxSwift
import UIKit

public class RxAnimatedCollectionViewController<ViewModel: AnimatableViewModel>: RxCollectionViewController<ViewModel> {
    open var animationConfiguration: AnimationConfiguration {
        AnimationConfiguration(insertAnimation: .fade, reloadAnimation: .fade, deleteAnimation: .fade)
    }

    public lazy var dataSource = AnimatableDataSource<ViewModel.Section, ViewModel.Item>.CollectionView.animated(
        animationConfiguration: animationConfiguration
    )
    
    public var dataSourceBinding: Disposable?

    override func setupBindings() {
        super.setupBindings()
        dataSourceBinding = viewModel.sections.asDriver()
            .drive(collectionView.rx.items(dataSource: dataSource))
    }
}
