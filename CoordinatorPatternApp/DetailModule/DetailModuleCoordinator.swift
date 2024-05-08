//
//  DetailModuleCoordinator.swift
//  CoordinatorPatternApp
//
//  Created by Gustavo Araujo Santos on 08/05/24.
//

import UIKit
import Foundation

class DetailModuleCoordinator: CoordinatorProtocol {
    
    weak var finishDelegate: (any CoordinatorFinishDelegate)?
    var navigationController: UINavigationController
    var childCoordinators: [any CoordinatorProtocol] = []
    var type: CoordinatorType = .detail
    
    required init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    deinit {
        print("\(DetailModuleCoordinator.self) deinit")
    }
    
    func start() {
        let viewModel = DetailModuleViewModel(onGoToProfileTap: goToProfileModule, onGoToMainTap: goToMainModule)
        let viewController = DetailModuleViewController(viewModel: viewModel)
        navigationController.pushViewController(viewController, animated: true)
    }
    
    private func goToProfileModule() {
        let profileModuleCoordinator = ProfileModuleCoordinator(navigationController)
        profileModuleCoordinator.finishDelegate = self
        profileModuleCoordinator.start()
        childCoordinators.append(profileModuleCoordinator)
    }
    
    private func goToMainModule() {
        navigationController.popViewController(animated: true)
        finish()
    }
}

extension DetailModuleCoordinator: CoordinatorFinishDelegate {
    public func coordinatorDidFinish(childCoordinator: CoordinatorProtocol) {
        childCoordinators = childCoordinators.filter({ $0.type != childCoordinator.type })
    }
}
