//
//  CustomAnimatableSectionModelType.swift
//  RxMVVM
//
//  Created by Sergey Balashov on 27.03.2022.
//

import RxDataSources
import ConfigurableUI

public protocol CustomAnimatableSectionModelType: AnimatableSectionModelType where Item: RowViewModel {
    associatedtype Section
}
