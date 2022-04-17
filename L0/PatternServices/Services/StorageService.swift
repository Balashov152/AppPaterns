//
//  StorageService.swift
//  iOSPatterns
//
//  Created by Sergey Balashov on 26.03.2022.
//

import RxSwift
import PatternModels

public protocol NotesServicable {
    func getNotes() -> Observable<[Note]>
}

struct NotesService {}

extension NotesService: NotesServicable {
    func getNotes() -> Observable<[Note]> {
        var notes: [Note] = []
        
        for _ in 0 ..< 100 {
            notes.append(Note(text: UUID().uuidString, date: Date()))
        }
        
        return .just(notes)
    }
}
