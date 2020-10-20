//
//  CharactersFactory.swift
//  Marvel
//
//  Created by Pablo Blanco Peris on 17/10/2020.
//  Copyright © 2020 pbp. All rights reserved.
//

import Foundation
import UIKit


final class CharactersFactory : ViewControllerFactory {
    
    typealias Dependencies = Empty

    var viewController: (Empty) -> UIViewController {
        return {dependencies in
            return CharactersViewController(viewModel : CharactersViewModel())
        }
    }
}
