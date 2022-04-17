//
//  ViewController.swift
//  iOSPatterns
//
//  Created by Sergey Balashov on 26.03.2022.
//

import PatternFoundation
import SnapKit
import UIKit

class ViewController: BaseViewController {
    private let modulesFactory: ModulesFactorable

    init(modulesFactory: ModulesFactorable) {
        self.modulesFactory = modulesFactory

        super.init()
    }

    lazy var mvvmButton: UIButton = {
        let button = patternButton(title: "Rx+MVVM Example")
        button.addTarget(self, action: #selector(openMVVMExample), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(mvvmButton)

        mvvmButton.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }

    @objc func openMVVMExample() {
        let module = modulesFactory.mvvmModule()
        navigationController?.pushViewController(module, animated: true)
    }

    private func patternButton(title: String) -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.setTitleColor(.blue, for: .normal)

        return button
    }
}
