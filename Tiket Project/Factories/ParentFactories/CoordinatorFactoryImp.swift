//
//  CoordinatorFactoryImp.swift
//  Tiket Project
//
//  Created by Nur Irfan Pangestu on 19/11/20.
//

import Foundation
import UIKit

final class CoordinatorFactoryImp: CoordinatorFactory {
    
    func makeSplashCoordinator(router: Router) -> Coordinator & SplashCoordinatorOutput {
        let coordinator = SplashCoordinator(router: router, factory: ModuleFactoryImp())
        return coordinator
    }
    
    func makeHeroCoordinator(router: Router) -> HeroCoordinatorOutput & Coordinator {
        let coordinator = HeroCoordinator(router: router, factory: ModuleFactoryImp(), viewModel: ViewModelFactoryImp())
        return coordinator
    }
    
    
}


extension CoordinatorFactoryImp {
    
    func router(_ navController: UINavigationController?) -> Router {
        return RouterImp(rootController: navigationController(navController))
    }
    
    func navigationController(_ navController: UINavigationController?) -> UINavigationController {
        if let navController = navController { return navController }
        else { return UINavigationController.controllerFromStoryboard(.main) }
    }
}
