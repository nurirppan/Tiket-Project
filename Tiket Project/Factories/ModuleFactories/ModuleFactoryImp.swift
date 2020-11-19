//
//  ModuleFactoryImp.swift
//  Tiket Project
//
//  Created by Nur Irfan Pangestu on 19/11/20.
//

import Foundation

// MARK: - splash
final class ModuleFactoryImp: ModuleFactory {
    
    func makeSplashOutput() -> SplashView {
        let vc = SplashVC()
        return vc
    }
    
}

// MARK: - HERO
extension ModuleFactoryImp {
    func makeHeroOutput() -> HeroView {
        let vc = HeroVC()
        return vc
    }
    
    func makeHeroDetailOutput() -> HeroDetailView {
        let vc = HeroDetailVC()
        return vc
    }
}
