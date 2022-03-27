//
//  NotesViewModel.swift
//  iOSPatterns
//
//  Created by Sergey Balashov on 26.03.2022.
//

import Foundation
import RxMVVM
import RxCocoa
import RxSwift
import PatternFoundation
import ConfigurableUI

class NotesViewModel: ReloadViewModel {
    typealias SectionModel = CustomSectionModel<String, NoteTableViewCellViewModel>
    
    // MARK: - Dependencies
    
    private let storage: StorageServicing
    
    // MARK: - Enviroment

    var sections: BehaviorRelay<[SectionModel]> = .init(value: [])
    private var disposeBag = DisposeBag()
    
    init(storage: StorageServicing) {
        self.storage = storage
    }
}

extension NotesViewModel: ViewCyicleHandler {
    func viewDidLoad() {
        storage.getNotes()
            .observe(on: ConcurrentDispatchQueueScheduler(queue: .global()))
            .map { notes -> [SectionModel] in
                [
                    SectionModel(model: "Section",
                                 items: notes.map { NoteTableViewCellViewModel(text: $0.text) })
                ]
            }
            .bind(to: sections)
            .disposed(by: disposeBag)
    }
}


