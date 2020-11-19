//
//  CoordinatorFactory.swift
//  Tiket Project
//
//  Created by Nur Irfan Pangestu on 19/11/20.
//

import Foundation


protocol CoordinatorFactory {
    
    func makeSplashCoordinator(router: Router) -> Coordinator & SplashCoordinatorOutput
    
    func makeHeroCoordinator(router: Router) -> Coordinator & HeroCoordinatorOutput
    
}
