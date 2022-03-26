//
//  ReloadViewModel.swift
//  RxMVVM
//
//  Created by Sergey Balashov on 26.03.2022.
//

import RxDataSources
import RxCocoa
import ConfigurableUI

public protocol ReloadViewModel: AnyObject {
    associatedtype Section
    associatedtype Item: RowViewModel
    
    typealias SectionModel = RxDataSources.SectionModel<Section, Item>
        
    var sections: BehaviorRelay<[SectionModel]> { get }
}
