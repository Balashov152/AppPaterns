//
//  StorageService.swift
//  iOSPatterns
//
//  Created by Sergey Balashov on 26.03.2022.
//

import RxSwift
import Foundation

protocol StorageServicing {
    func getNotes() -> Observable<[Note]>
}

struct StorageService {}

extension StorageService: StorageServicing {
    func getNotes() -> Observable<[Note]> {
        var notes: [Note] = []
        
        for _ in 0 ..< 100 {
            notes.append(Note(text: UUID().uuidString, date: Date()))
        }
        
        return .just(notes)
    }
}
