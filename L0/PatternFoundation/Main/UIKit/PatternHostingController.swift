//
//  PatternHostingController.swift
//  PatternFoundation
//
//  Created by Sergey Balashov on 17.04.2022.
//

import SwiftUI

public class PatternHostingController<RootView: View>: UIHostingController<RootView> {
    public weak var cycleHandler: ViewCycleHandler?
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        cycleHandler?.viewDidLoad()
    }

    override open func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        cycleHandler?.viewWillAppear(animated)
    }

    override open func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        cycleHandler?.viewDidAppear(animated)
    }

    override open func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        cycleHandler?.viewWillDisappear(animated)
    }

    override open func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        cycleHandler?.viewDidDisappear(animated)
    }
}
