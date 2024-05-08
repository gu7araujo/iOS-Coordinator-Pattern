//
//  ProfileModuleViewModel.swift
//  CoordinatorPatternApp
//
//  Created by Gustavo Araujo Santos on 08/05/24.
//

import Foundation

final class ProfileModuleViewModel {
    
    private let backModule: () -> Void
    
    init(backModule: @escaping () -> Void) {
        self.backModule = backModule
    }
    
    func goToBackModule() {
        backModule()
    }
}
