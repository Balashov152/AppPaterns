//
//  ReloadTableViewModel.swift
//  RxMVVM
//
//  Created by Sergey Balashov on 26.03.2022.
//

import ConfigurableUI
import RxCocoa
import RxDataSources

public protocol ReloadTableViewModel: AnyObject {
    associatedtype Section
    associatedtype Item: RowViewModel

    typealias SectionModel = RxDataSources.SectionModel<Section, Item>

    var sections: BehaviorRelay<[SectionModel]> { get }
}
