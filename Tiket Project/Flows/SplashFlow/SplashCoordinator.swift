//
//  SplashCoordinator.swift
//  Tiket Project
//
//  Created by Nur Irfan Pangestu on 19/11/20.
//

import Foundation

final class SplashCoordinator: BaseCoordinator, SplashCoordinatorOutput {
    
    var finishFLow: (() -> Void)?
    
    private let factory: ModuleFactory
    private let router: Router
    
    init(router: Router, factory: ModuleFactory) {
        self.router = router
        self.factory = factory
    }
    
    override func start() {
        self.showSplashScreen()
    }
    
    private func showSplashScreen() {
        let view = factory.makeSplashOutput()
        view.onCompleteTimer = { [weak self] in
            guard let self = self else { return }
            self.finishFLow?()
        }
        router.setRootModule(view, hideBar: true)
    }
}
