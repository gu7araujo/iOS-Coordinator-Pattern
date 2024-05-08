//
//  MainModuleCoordinator.swift
//  CoordinatorPatternApp
//
//  Created by Gustavo Araujo Santos on 08/05/24.
//

import UIKit
import Foundation

class MainModuleCoordinator: CoordinatorProtocol {
    
    weak var finishDelegate: (any CoordinatorFinishDelegate)?
    var navigationController: UINavigationController
    var childCoordinators: [any CoordinatorProtocol] = []
    var type: CoordinatorType = .main
    
    required init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    deinit {
        print("\(MainModuleCoordinator.self) deinit")
    }
    
    func start() {
        let viewModel = MainModuleViewModel(onGoToDetailTap: navigateToDetailModule)
        let viewController = MainModuleViewController(viewModel: viewModel)
        navigationController.pushViewController(viewController, animated: true)
    }
    
    private func navigateToDetailModule() {
        let detailModuleCoordinator = DetailModuleCoordinator(navigationController)
        detailModuleCoordinator.finishDelegate = self
        detailModuleCoordinator.start()
        childCoordinators.append(detailModuleCoordinator)
    }
}

extension MainModuleCoordinator: CoordinatorFinishDelegate {
    public func coordinatorDidFinish(childCoordinator: CoordinatorProtocol) {
        childCoordinators = childCoordinators.filter({ $0.type != childCoordinator.type })
    }
}
