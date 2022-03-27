//
//  CustomSectionModelType.swift
//  RxMVVM
//
//  Created by Sergey Balashov on 27.03.2022.
//

import ConfigurableUI
import RxDataSources

public protocol CustomSectionModelType: SectionModelType where Item: RowViewModel {
    associatedtype Section
}
