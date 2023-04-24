//
//  SUIMVPModuleOutput.swift
//  iOSPatterns
//
//  Created by Sergey Balashov on 27.05.2022.
//

import Foundation

protocol SUIMVPModuleOutput: AnyObject {
    func moduleDidFinishWork(with index: Int)
}
