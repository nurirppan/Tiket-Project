//
//  ViewModelFactory.swift
//  Tiket Project
//
//  Created by Nur Irfan Pangestu on 19/11/20.
//

import Foundation

protocol ViewModelFactory {
    func makeHeroVM() -> HeroVM
    func makeHeroDetailVM() -> HeroDetailVM
}

