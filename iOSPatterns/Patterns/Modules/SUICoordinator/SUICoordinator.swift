//
//  SUICoordinator.swift
//  iOSPatterns
//
//  Created by Sergey Balashov on 27.05.2022.
//

import SwiftUI

struct SUICoordinatorView: View {
    @ObservedObject private var object: SUICoordinatorObject
    
    init(object: SUICoordinatorObject) {
        self.object = object
    }
    
    var body: some View {
        
        ZStack {
            NavigationView {
                if let rootView = object.rootView {
                    rootView.view
                }
            }
            
            linkes
        }
        
    }
    
    var linkes: some View {
        ForEach(object.views) { container in
            NavigationLink(
                isActive: isActive(id: container.id),
                destination: { container.view },
                label: { EmptyView() }
            )
            .id(container.id)
        }
    }
    
//    func
    
    func isActive(id: String) -> Binding<Bool> {
        Binding<Bool>(get: {
            object.activeLinks.contains(where: { $0 == id })
        }, set: { isActive in
            if !isActive {
                object.activeLinks.removeAll(where: { $0 == id })
            }
        })
    }
}

struct ContainerView: Identifiable {
    let id: String
    let view: AnyView
}

class SUICoordinatorObject: ObservableObject {
    private let modulesFactory: ModulesFactorable
    
    @Published var rootView: ContainerView?
    @Published var views: [ContainerView] = []
    @Published var activeLinks: [String] = []
//    @Published var isActiveSecond = false
    
//    @Published var secondView: ContainerView?
    
    init(
        modulesFactory: ModulesFactorable
    ) {
        self.modulesFactory = modulesFactory
    }
    
    func start() {
        let view = modulesFactory.mvpsuiModule(output: self).view
        self.rootView = ContainerView(
            id: "root",
            view: AnyView(view)
        )
        
        if rootView == nil {
            assertionFailure("rootView isn't set")
        }
    }
}

extension SUICoordinatorObject: MVPSUIOutput {
    func moduleDidFinishWork(with index: Int) {
        let (view, input) = modulesFactory.mvpsuiModule(output: self)
        // Any updates view before show
        input.updateViewIndex(int: index)
        
        let id = UUID().uuidString
        
        // Open next view
        views.append(ContainerView(id: id, view: AnyView(view)))
        
        // Open view
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
//            self.isActiveSecond = true
            self.activeLinks.append(id)
        }
    }
}

extension SUICoordinatorObject {
    enum ActiveLink: String, CaseIterable, Identifiable, Equatable {
        var id: String { rawValue }
        
        case root
        case anyDeepScreen
    }
}
