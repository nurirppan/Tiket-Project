//
//  HeroView.swift
//  Tiket Project
//
//  Created by Nur Irfan Pangestu on 19/11/20.
//

import Foundation

protocol HeroView: BaseView {
    var viewModel: HeroVM! { get set }
    var onHeroDetailTapped: ((Int, [HeroStatusResponse]) -> Void)? { get set }
    
}
