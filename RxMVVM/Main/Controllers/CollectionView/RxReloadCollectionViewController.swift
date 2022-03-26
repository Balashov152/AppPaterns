//
//  RxReloadCollectionViewController.swift
//  RxMVVM
//
//  Created by Sergey Balashov on 26.03.2022.
//

import RxDataSources
import RxSwift
import UIKit

public class RxReloadCollectionViewController<ViewModel: ReloadViewModel>: RxCollectionViewController<ViewModel> {
    public lazy var dataSource = DataSource<ViewModel.Section, ViewModel.Item>.CollectionView.reload()
    public var dataSourceBinding: Disposable?
    
    override func setupBindings() {
        super.setupBindings()
        dataSourceBinding = viewModel.sections.asDriver()
            .drive(collectionView.rx.items(dataSource: dataSource))
    }
}
