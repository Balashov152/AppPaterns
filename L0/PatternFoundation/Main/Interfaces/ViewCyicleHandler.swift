//
//  ViewCyicleHandler.swift
//  RxMVVM
//
//  Created by Sergey Balashov on 26.03.2022.
//

import Foundation

public protocol ViewCyicleHandler {
    func viewDidLoad()
    func viewWillAppear(_ animated: Bool)
    func viewDidAppear(_ animated: Bool)
    func viewWillDisappear(_ animated: Bool)
    func viewDidDisappear(_ animated: Bool)
}

public extension ViewCyicleHandler {
    func viewDidLoad() {}
    func viewWillAppear(_ animated: Bool) {}
    func viewDidAppear(_ animated: Bool) {}
    func viewWillDisappear(_ animated: Bool) {}
    func viewDidDisappear(_ animated: Bool) {}
}
