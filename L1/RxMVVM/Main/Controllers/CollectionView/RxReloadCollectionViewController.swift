//
//  RxReloadCollectionViewController.swift
//  RxMVVM
//
//  Created by Sergey Balashov on 26.03.2022.
//

import RxDataSources
import RxSwift
import UIKit

public class RxReloadCollectionViewController<ViewModel: RxViewModel & ReloadViewModel>: RxCollectionViewController<ViewModel> {
    public lazy var dataSource = DataSource<ViewModel.SectionModel>.CollectionView.reload()
    public var dataSourceBinding: Disposable?
    
    public override func setupBindings() {
        super.setupBindings()
        dataSourceBinding = viewModel.sections
            .asDriver(onErrorJustReturn: [])
            .drive(collectionView.rx.items(dataSource: dataSource))
    }
}
