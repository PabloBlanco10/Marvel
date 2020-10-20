//
//  CharacterDetailRouter.swift
//  Marvel
//
//  Created by Pablo Blanco Peris on 19/10/2020.
//  Copyright © 2020 pbp. All rights reserved.
//

import Foundation

class CharacterDetailRouter : Router {
    
    typealias Dependencies = CharacterDetailConfiguration
    typealias Factory = CharacterDetailFactory
    
    var viewControllerFactory: CharacterDetailFactory?
    
    required init(viewControllerFactory: CharacterDetailFactory?) { self.viewControllerFactory = viewControllerFactory }
}
