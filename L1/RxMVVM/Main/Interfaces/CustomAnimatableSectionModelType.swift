//
//  CustomAnimatableSectionModelType.swift
//  RxMVVM
//
//  Created by Sergey Balashov on 27.03.2022.
//

import ConfigurableUI
import RxDataSources

public protocol CustomAnimatableSectionModelType: AnimatableSectionModelType where Item: RowViewModel {
    associatedtype Section
}
