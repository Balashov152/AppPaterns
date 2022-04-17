//
//  CustomSectionModel.swift
//  RxMVVM
//
//  Created by Sergey Balashov on 27.03.2022.
//

import ConfigurableUI

public struct CustomSectionModel<Section, Item: RowViewModel>: CustomSectionModelType {
    public var model: Section
    public var items: [Item]

    public init(model: Section, items: [Item]) {
        self.model = model
        self.items = items
    }

    public init(original: CustomSectionModel<Section, Item>, items: [Item]) {
        model = original.model
        self.items = items
    }
}
