//
//  BaseViewController.swift
//  PatternFoundation
//
//  Created by Sergey Balashov on 17.04.2022.
//

import Foundation
import UIKit

open class BaseViewController: UIViewController {
    
    public convenience init() {
        self.init(nibName: nil, bundle: nil)
    }
    
    public override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
