//
//  ServiceFactory.swift
//  iOSPatterns
//
//  Created by Sergey Balashov on 17.04.2022.
//

import Foundation

public protocol ServiceFactorable {
    func notesServicable() -> NotesServicable
}

public struct ServiceFactory {
    public init() {}
}

extension ServiceFactory: ServiceFactorable {
    public func notesServicable() -> NotesServicable {
        NotesService()
    }
}
