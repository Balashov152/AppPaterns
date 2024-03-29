//
//  ViewController.swift
//  iOSPatterns
//
//  Created by Sergey Balashov on 26.03.2022.
//

import PatternFoundation
import SnapKit
import UIKit
import SwiftUI

class RootViewController: BaseViewController {
    private let modulesFactory: ModulesFactorable

    init(modulesFactory: ModulesFactorable) {
        self.modulesFactory = modulesFactory

        super.init()
    }

    lazy var mvvmButton: UIButton = {
        let button = patternButton(title: "Rx+MVVM")
        button.addTarget(self, action: #selector(openMVVMExample), for: .touchUpInside)
        return button
    }()
    
    lazy var mvpsuiButton: UIButton = {
        let button = patternButton(title: "Coordinator+MVP+SUI")
        button.addTarget(self, action: #selector(openSUICoordinatorFlow), for: .touchUpInside)
        return button
    }()
    
    lazy var mvpsuiNavigationPathButton: UIButton = {
        let button = patternButton(title: "Coordinator + NavigationPath + SwiftUI + MVP")
        if #available(iOS 16.0, *) {
            button.addTarget(self, action: #selector(openSUINavigationPathFlow), for: .touchUpInside)
        }
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationController?.title = "Examples"
        
        let stack = UIStackView(arrangedSubviews: [mvvmButton, mvpsuiButton])
        if #available(iOS 16.0, *) {
            stack.addArrangedSubview(mvpsuiNavigationPathButton)
        }
        stack.axis = .vertical
        
        view.addSubview(stack)
        stack.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }

    @objc func openMVVMExample() {
        let module = modulesFactory.mvvmModule()
        navigationController?.pushViewController(module, animated: true)
    }
    
    
    @objc func openSUICoordinatorFlow() {
        let object = SUICoordinatorObject(modulesFactory: modulesFactory)
        let view = SUICoordinatorView(object: object)
        
        object.start()
        
        let hosting = UIHostingController(rootView: view)
        navigationController?.pushViewController(hosting, animated: true)
    }

    @available(iOS 16.0, *)
    @objc func openSUINavigationPathFlow() {
        let object = SUINavigationPathCoordinatorObject(modulesFactory: modulesFactory)
        let view = SUINavigationPathCoordinatorView(object: object)
        
        object.start()

        let hosting = UIHostingController(rootView: view)
        hosting.modalPresentationStyle = .overFullScreen
        navigationController?.present(hosting, animated: true)
    }

    private func patternButton(title: String) -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.setTitleColor(.blue, for: .normal)

        return button
    }
}
