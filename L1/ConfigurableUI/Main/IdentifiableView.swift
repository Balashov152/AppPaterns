//
//  IdentifiableView.swift
//  ConfigurableUI
//
//  Created by Sergey Balashov on 26.03.2022.
//

import UIKit

/// Протокол который нужно подержать каждой ячейке что бы работать с ней по названию ее класса
public protocol IdentifiableView: AnyObject {
    static var identifier: String { get }
}

/// Разширение для стандартоного `UITableViewCell`
extension UITableViewCell: IdentifiableView {
    public static var identifier: String {
        String(describing: self)
    }
}

/// Разширение для стандартоного `UICollectionViewCell`
extension UICollectionViewCell: IdentifiableView {
    public static var identifier: String {
        String(describing: self)
    }
}
