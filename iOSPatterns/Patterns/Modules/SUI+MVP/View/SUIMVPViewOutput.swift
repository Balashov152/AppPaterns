//
//  SUIMVPViewOutput.swift
//  iOSPatterns
//
//  Created by Sergey Balashov on 27.05.2022.
//

import Foundation

protocol SUIMVPViewOutput: AnyObject {
    func viewDidRequestUpdateIndex()
    func viewDidRequestNextView()
}
