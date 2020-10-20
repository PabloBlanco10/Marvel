//
//  CharactersRouter.swift
//  Marvel
//
//  Created by Pablo Blanco Peris on 19/10/2020.
//  Copyright © 2020 pbp. All rights reserved.
//

import Foundation

class CharactersRouter : Router {
    
    typealias Dependencies = Empty
    typealias Factory = CharactersFactory
    
    var viewControllerFactory: CharactersFactory?
    
    required init(viewControllerFactory: CharactersFactory?) {
        self.viewControllerFactory = viewControllerFactory
    }
}
