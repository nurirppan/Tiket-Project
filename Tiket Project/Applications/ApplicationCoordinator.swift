//
//  ApplicationCoordinator.swift
//  Tiket Project
//
//  Created by Nur Irfan Pangestu on 19/11/20.
//

import Foundation

fileprivate var onboardingWasShown = false
fileprivate var isAutorized = false

fileprivate enum LauncInstructor {
    case main, auth, splash
    
    static func configure(tutorialWasShown: Bool = onboardingWasShown,
                          isAutorized: Bool = isAutorized) -> LauncInstructor {
        
        switch (tutorialWasShown, isAutorized) {
        case (false, false):
            return .splash
        case (true, true):
            return .main
        case (false, true):
            return .main
        case (true, false):
            return .main
        }
    }
}

final class ApplicationCoordinator: BaseCoordinator {
    private let coordinatorFactory: CoordinatorFactory
    private let router: Router
    
    private var instructor: LauncInstructor {
        return LauncInstructor.configure()
    }
    
    init(router: Router, coordinatorFactory: CoordinatorFactory) {
        self.router = router
        self.coordinatorFactory = coordinatorFactory
    }
    
    override func start() {
        switch instructor {
        case .splash:
            runSplashFlow()
        case .auth:
            runMainFlow()
        case .main:
            runMainFlow()
        }
    }
    
    private func runSplashFlow() {
        let coordinator = coordinatorFactory.makeSplashCoordinator(router: router)
        coordinator.finishFLow = { [weak self, weak coordinator] in
            isAutorized = false
            onboardingWasShown = true
            self?.start()
            self?.removeDependency(coordinator)
        }
        addDependency(coordinator)
        coordinator.start()
    }

    private func runMainFlow() {
        let coordinator = coordinatorFactory.makeHeroCoordinator(router: router)
        addDependency(coordinator)
        coordinator.start()
    }
}
