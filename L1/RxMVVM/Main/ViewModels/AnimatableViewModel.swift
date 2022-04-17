//
//  AnimatableViewModel.swift
//  RxMVVM
//
//  Created by Sergey Balashov on 26.03.2022.
//

import ConfigurableUI
import RxCocoa
import RxDataSources

public protocol AnimatableViewModel: AnyObject {
    associatedtype SectionModel: CustomAnimatableSectionModelType

    var sections: BehaviorRelay<[SectionModel]> { get }
}
