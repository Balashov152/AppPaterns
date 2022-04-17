//
//  ViewCycleHandler.swift
//  RxMVVM
//
//  Created by Sergey Balashov on 26.03.2022.
//

import Foundation

public protocol ViewCycleHandler: AnyObject {
    func viewDidLoad()
    func viewWillAppear(_ animated: Bool)
    func viewDidAppear(_ animated: Bool)
    func viewWillDisappear(_ animated: Bool)
    func viewDidDisappear(_ animated: Bool)
}

public extension ViewCycleHandler {
    func viewDidLoad() {}
    func viewWillAppear(_: Bool) {}
    func viewDidAppear(_: Bool) {}
    func viewWillDisappear(_: Bool) {}
    func viewDidDisappear(_: Bool) {}
}
