//
//  ReloadViewModel.swift
//  RxMVVM
//
//  Created by Sergey Balashov on 26.03.2022.
//

import ConfigurableUI
import RxCocoa
import RxDataSources

public protocol ReloadViewModel: AnyObject {
    associatedtype SectionModel: CustomSectionModelType

    var sections: BehaviorRelay<[SectionModel]> { get }
}
