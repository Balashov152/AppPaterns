//
//  RxCollectionViewController.swift
//  RxMVVM
//
//  Created by Sergey Balashov on 26.03.2022.
//

import RxDataSources
import RxSwift
import UIKit

public class RxCollectionViewController<ViewModel>: RxViewController<ViewModel> {
    lazy var refreshControl: UIRefreshControl = {
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
    
    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: view.frame, collectionViewLayout: collectionViewLayout)
        collectionView.keyboardDismissMode = .interactive
        collectionView.backgroundColor = .white
        return collectionView
    }()

    override func loadView() {
        super.loadView()
        view = collectionView
    }
}
