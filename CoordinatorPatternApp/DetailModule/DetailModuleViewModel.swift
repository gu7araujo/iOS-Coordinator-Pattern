//
//  DetailModuleViewModel.swift
//  CoordinatorPatternApp
//
//  Created by Gustavo Araujo Santos on 08/05/24.
//

import Foundation

final class DetailModuleViewModel {
    
    private let onGoToProfileTap: () -> Void
    private let onGoToMainTap: () -> Void
    
    init(onGoToProfileTap: @escaping () -> Void, onGoToMainTap: @escaping () -> Void) {
        self.onGoToProfileTap = onGoToProfileTap
        self.onGoToMainTap = onGoToMainTap
    }
    
    func goToProfileTapped() {
        onGoToProfileTap()
    }
    
    func goToMainTapped() {
        onGoToMainTap()
    }
}
