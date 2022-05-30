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
                rootView
            }

            secondViewLink
        }
        
    }
    
    @ViewBuilder private var rootView: some View {
        if let rootView = object.rootView {
            rootView.view
                .background(linkes(view: rootView))
        }
    }
    
//    var secondViewLink: some View {
////        Group {
//        NavigationLink(
//                isActive: isActive(id: object.secondView?.id),
//                destination: {
//                    if let second = object.secondView {
//                        second.view
//                            .background(thirdViewLink)
//                    }
//                },
//                label: { Text("secondViewLink") }
//            )
//    }
//
//    var thirdViewLink: some View {
//        NavigationLink(
//            isActive: isActive(id: object.thirdView?.id),
//            destination: {
//                if let second = object.thirdView {
//                    second.view
//                }
//            },
//            label: { Text("thirdViewLink") }
//        )
//    }
    
    func linkes(view: ContainerView) -> some View {
        ForEach(view.childrens) { children in
            NavigationLink(
                isActive: isActive(id: view.id),
                destination: {
                    children.view
//                        .background(linkes(view: children))
                },
                label: { EmptyView() }
            )
        }
    }
    
//
//
//    var linkes: some View {
//        ForEach(object.views) { container in
//            NavigationLink(
//                isActive: isActive(id: container.id),
//                destination: { container.view },
//                label: { EmptyView() }
//            )
//            .id(container.id)
//        }
//    }
//
//    func createNavigatonLinks(view: ContainerView) {
//        ForEach(view.links) { container in
//            NavigationLink(
//                isActive: isActive(id: container.id),
//                destination: { container.view },
//                label: { EmptyView() }
//            )
//            .id(container.id)
//        }
//    }
    
    func isActive(id: String?) -> Binding<Bool> {
        Binding<Bool>(get: {
            object.activeLinks.contains(where: { $0 == id })
        }, set: { isActive in
            if !isActive {
                object.activeLinks.removeAll(where: { $0 == id })
            }
        })
    }
}

class ContainerView: Identifiable {
    let id: String
    let view: AnyView
    
    var childrens: [ContainerView]
    
    init(id: String, view: AnyView, childrens: [ContainerView]) {
        self.id = id
        self.view = view
        self.childrens = childrens
    }
}

class SUICoordinatorObject: ObservableObject {
    private let modulesFactory: ModulesFactorable
    
    @Published var rootView: ContainerView?
//    @Published var secondView: ContainerView<MVPSUIView>?
//    @Published var thirdView: ContainerView<MVPSUIView>?
    
//    @Published var views: [ContainerView] = []
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
            id: UUID().uuidString,
            view: AnyView(view),
            childrens: []
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
        
//        let id = UUID().uuidString
        
        // Open next view
        
        
        if rootView?.childrens.isEmpty == true {
            let container = ContainerView(
                id: "second",
                view: AnyView(view),
                childrens: []
            )
            
            rootView?.childrens.append(container)
            self.activeLinks.append("second")
            
        } else if let secondView = rootView?.allContainers().first(where: {$0.id == "second" }) {
            let container = ContainerView(
                id: "third",
                view: AnyView(view),
                childrens: []
            )
            
            secondView.childrens.append(container)
            self.activeLinks.append("third")
        }
        
//        rootView?.childrens.append(container)
//        views.append(ContainerView(id: id, view: AnyView(view)))
        
        // Open view
//        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
//            self.isActiveSecond = true
//            self.activeLinks.append(container.id)
//        }
    }
}

extension SUICoordinatorObject {
    enum ActiveLink: String, CaseIterable, Identifiable, Equatable {
        var id: String { rawValue }
        
        case root
        case anyDeepScreen
    }
}

extension ContainerView {
    func allContainers() -> [ContainerView] {
        concat(childrens: childrens)
    }
    
    func concat(childrens: [ContainerView]) -> [ContainerView] {
        childrens.reduce([], { $0 + concat(childrens: $1.childrens) })
    }
}
