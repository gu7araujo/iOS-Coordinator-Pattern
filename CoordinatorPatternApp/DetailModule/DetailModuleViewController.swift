//
//  DetailModuleViewController.swift
//  CoordinatorPatternApp
//
//  Created by Gustavo Araujo Santos on 08/05/24.
//

import UIKit
import Foundation

class DetailModuleViewController: UIViewController {
    
    let viewModel: DetailModuleViewModel
    
    init(viewModel: DetailModuleViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        let navigateToProfileButton = UIButton(type: .system)
        navigateToProfileButton.setTitle("Navigate to next module!", for: .normal)
        navigateToProfileButton.addTarget(self, action: #selector(profileTapped), for: .touchUpInside)
        
        let navigateToMainButton = UIButton(type: .system)
        navigateToMainButton.setTitle("Navigate to back module!", for: .normal)
        navigateToMainButton.addTarget(self, action: #selector(mainTapped), for: .touchUpInside)
        
        view.addSubview(navigateToProfileButton)
        view.addSubview(navigateToMainButton)
        
        navigateToProfileButton.translatesAutoresizingMaskIntoConstraints = false
        navigateToMainButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            navigateToProfileButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            navigateToProfileButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -50),
            navigateToMainButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            navigateToMainButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 50)
        ])
    }
    
    @objc func profileTapped() {
        viewModel.goToProfileTapped()
    }
    
    @objc func mainTapped() {
        viewModel.goToMainTapped()
    }
}
