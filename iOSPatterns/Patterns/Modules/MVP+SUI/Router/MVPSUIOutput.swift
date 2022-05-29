//
//  MVPSUIOutput.swift
//  iOSPatterns
//
//  Created by Sergey Balashov on 27.05.2022.
//

import Foundation

protocol MVPSUIOutput: AnyObject {
    func moduleDidFinishWork(with index: Int)
}
