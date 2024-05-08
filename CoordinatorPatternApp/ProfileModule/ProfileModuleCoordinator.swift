//
//  ProfileModuleCoordinator.swift
//  CoordinatorPatternApp
//
//  Created by Gustavo Araujo Santos on 08/05/24.
//

import UIKit
import Foundation

class ProfileModuleCoordinator: CoordinatorProtocol {
    
    weak var finishDelegate: (any CoordinatorFinishDelegate)?
    var navigationController: UINavigationController
    var childCoordinators: [any CoordinatorProtocol] = []
    var type: CoordinatorType = .profile
    
    required init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    deinit {
        print("\(ProfileModuleCoordinator.self) deinit")
    }
    
    func start() {
        let viewModel = ProfileModuleViewModel(backModule: backModule)
        let viewController = ProfileModuleViewController(viewModel: viewModel)
        navigationController.pushViewController(viewController, animated: true)
    }
    
    private func backModule() {
        navigationController.popViewController(animated: true)
        finish()
    }
}
