//
//  ViewModelFactoryImp.swift
//  Tiket Project
//
//  Created by Nur Irfan Pangestu on 19/11/20.
//

import Foundation

final class ViewModelFactoryImp: ViewModelFactory {
    
    func makeHeroVM() -> HeroVM {
        return HeroVM()
    }
    
    func makeHeroDetailVM() -> HeroDetailVM {
        return HeroDetailVM()
    }
}

