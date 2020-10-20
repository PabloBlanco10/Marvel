//
//  CharacterDetailFactory.swift
//  Marvel
//
//  Created by Pablo Blanco Peris on 19/10/2020.
//  Copyright © 2020 pbp. All rights reserved.
//

import Foundation
import UIKit


struct CharacterDetailConfiguration : FactoryArguments {
    var id : Int
}

final class CharacterDetailFactory : ViewControllerFactory {
    typealias Dependencies = CharacterDetailConfiguration

    var viewController: (CharacterDetailConfiguration) -> UIViewController {
        return { dependencies in
            let viewModel = CharacterDetailViewModel(configuration: dependencies)
            return CharacterDetailViewController(viewModel: viewModel)
        }
    }
}
