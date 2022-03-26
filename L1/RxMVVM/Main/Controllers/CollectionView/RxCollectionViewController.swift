//
//  RxCollectionViewController.swift
//  RxMVVM
//
//  Created by Sergey Balashov on 26.03.2022.
//

import RxDataSources
import RxSwift
import UIKit

open class RxCollectionViewController<ViewModel: RxViewModel>: RxViewController<ViewModel> {
    open lazy var refreshControl: UIRefreshControl = {
        let control = UIRefreshControl()
        collectionView.refreshControl = control
        return control
    }()
    
    open var estimatedItemSize: CGSize { CGSize(width: 100, height: 100) }
    
    open lazy var collectionViewLayout: UICollectionViewFlowLayout = {
       let layout = UICollectionViewFlowLayout()
        layout.estimatedItemSize = estimatedItemSize
        layout.itemSize = UICollectionViewFlowLayout.automaticSize
        return layout
    }()
    
    open lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: view.frame, collectionViewLayout: collectionViewLayout)
        collectionView.keyboardDismissMode = .interactive
        collectionView.backgroundColor = .white
        return collectionView
    }()

    open override func loadView() {
        super.loadView()
        view = collectionView
    }
}
