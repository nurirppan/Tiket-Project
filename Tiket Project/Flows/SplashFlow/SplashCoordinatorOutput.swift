//
//  SplashCoordinatorOutput.swift
//  Tiket Project
//
//  Created by Nur Irfan Pangestu on 19/11/20.
//

import Foundation

protocol SplashCoordinatorOutput: class {
    
    var finishFLow: (() -> Void)? { get set }

}
