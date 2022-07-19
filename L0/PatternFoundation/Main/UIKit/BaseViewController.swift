//
//  BaseViewController.swift
//  PatternFoundation
//
//  Created by Sergey Balashov on 17.04.2022.
//

import Foundation
import UIKit

open class BaseViewController: UIViewController {
    public init() {
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    public required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
