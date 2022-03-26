//
//  AnimatableViewModel.swift
//  RxMVVM
//
//  Created by Sergey Balashov on 26.03.2022.
//

import RxDataSources
import RxCocoa
import ConfigurableUI

public protocol AnimatableViewModel: AnyObject {
    associatedtype Section: IdentifiableType
    associatedtype Item: RowViewModel & IdentifiableType & Equatable
    
    typealias SectionModel = RxDataSources.AnimatableSectionModel<Section, Item>
        
    var sections: BehaviorRelay<[SectionModel]> { get }
}
