//
//  HeroCoordinatorOutput.swift
//  Tiket Project
//
//  Created by Nur Irfan Pangestu on 19/11/20.
//

import Foundation

protocol HeroCoordinatorOutput: class {
    
    var finishFlow: (() -> Void)? { get set }
    
}
