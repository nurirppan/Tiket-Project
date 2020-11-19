//
//  ModuleFactory.swift
//  Tiket Project
//
//  Created by Nur Irfan Pangestu on 19/11/20.
//

import Foundation


protocol ModuleFactory {
    
    // MARK: - SPLASH
    func makeSplashOutput() -> SplashView
    
    // MARK: - HERO
    func makeHeroOutput() -> HeroView
    func makeHeroDetailOutput() -> HeroDetailView
}

