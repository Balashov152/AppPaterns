//
//  ViewController.swift
//  iOSPatterns
//
//  Created by Sergey Balashov on 26.03.2022.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    lazy var mvvmButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Rx+MVVM Example", for: .normal)
        button.setTitleColor(.blue, for: .normal)
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
        let storage = StorageService()
        let viewModel = NotesViewModel(storage: storage)
        let vc = NotesViewController<NotesViewModel>(viewModel: viewModel)
        
        navigationController?.pushViewController(vc, animated: true)
    }

}

