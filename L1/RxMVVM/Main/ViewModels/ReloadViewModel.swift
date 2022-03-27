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
    associatedtype SectionModel: CustomSectionModelType
        
    var sections: BehaviorRelay<[SectionModel]> { get }
}
