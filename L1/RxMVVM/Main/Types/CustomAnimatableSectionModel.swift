//
//  CustomAnimatableSectionModel.swift
//  RxMVVM
//
//  Created by Sergey Balashov on 27.03.2022.
//

import ConfigurableUI
import RxDataSources

public typealias AnimatableItem = RowViewModel & IdentifiableType & Equatable

public struct CustomAnimatableSectionModel<Section: IdentifiableType, Item: AnimatableItem>: CustomAnimatableSectionModelType {
    public typealias Identity = Section.Identity

    public var model: Section
    public var items: [Item]

    public var identity: Section.Identity {
        return model.identity
    }

    public init(model: Section, items: [Item]) {
        self.model = model
        self.items = items
    }

    public init(original: CustomAnimatableSectionModel<Section, Item>, items: [Item]) {
        model = original.model
        self.items = items
    }
}
