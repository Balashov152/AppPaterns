//
//  NotesViewModel.swift
//  iOSPatterns
//
//  Created by Sergey Balashov on 26.03.2022.
//

import ConfigurableUI
import Foundation
import PatternFoundation
import PatternServices
import RxCocoa
import RxMVVM
import RxSwift

typealias NotesViewModelInterface = (
    NotesViewModelType &
        AnimatableViewModel &
        ViewCycleHandler
)

protocol NotesViewModelType {
    func shakeData()
}

class NotesViewModel: NotesViewModelInterface {
    typealias SectionModel = CustomAnimatableSectionModel<String, NoteTableViewCellViewModel>

    // MARK: - Dependencies

    private let notesService: NotesServicable

    // MARK: - Environment

    var sections: BehaviorRelay<[SectionModel]> = .init(value: [])
    private var disposeBag = DisposeBag()

    init(notesService: NotesServicable) {
        self.notesService = notesService
    }

    func updateData() {
        notesService.getNotes()
            .observe(on: ConcurrentDispatchQueueScheduler(queue: .global()))
            .map { notes -> [SectionModel] in
                [
                    SectionModel(model: "Section",
                                 items: notes.map { NoteTableViewCellViewModel(text: $0.text) }),
                ]
            }
            .bind(to: sections)
            .disposed(by: disposeBag)
    }
}

// MARK: - NotesViewModelType

extension NotesViewModel {
    func shakeData() {
        updateData()
    }
}

// MARK: - ViewCycleHandler

extension NotesViewModel {
    func viewDidLoad() {
        updateData()
    }
}
