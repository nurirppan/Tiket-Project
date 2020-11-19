//
//  HeroDetailView.swift
//  Tiket Project
//
//  Created by Nur Irfan Pangestu on 19/11/20.
//

import Foundation

protocol HeroDetailView: BaseView {
    var id: Int? { get set }
    var model: [HeroStatusResponse] { get set }
    var viewModel: HeroDetailVM! { get set }
    
}
