//
//  MainModuleViewModel.swift
//  CoordinatorPatternApp
//
//  Created by Gustavo Araujo Santos on 08/05/24.
//

import Foundation

final class MainModuleViewModel {
    
    private let onGoToDetailTap: () -> Void
    
    init(onGoToDetailTap: @escaping () -> Void) {
        self.onGoToDetailTap = onGoToDetailTap
    }
    
    func goToDetailTapped() {
        onGoToDetailTap()
    }
}
