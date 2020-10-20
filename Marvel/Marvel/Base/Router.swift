//
//  Router.swift
//  Marvel
//
//  Created by Pablo Blanco Peris on 19/10/2020.
//  Copyright © 2020 pbp. All rights reserved.
//

import Foundation
import UIKit

enum Transition {
    case modal
    case push
}

protocol Router {
    associatedtype Dependencies: FactoryArguments
    associatedtype Factory: ViewControllerFactory
    
    var viewControllerFactory: Factory? { get }
    
    init(viewControllerFactory: Factory?)
    
    func navigate(from presenter: UIViewController, arguments: Dependencies, transition: Transition)
}


extension Router {
    func navigate<Arguments>(from presenter: UIViewController, arguments: Arguments, transition: Transition) where Arguments == Self.Factory.Dependencies {
        guard let viewController = viewControllerFactory?.viewController(arguments) else { return }
        
        switch transition {
        case .push:
            presenter.navigationController?.pushViewController(viewController, animated: true)
        case .modal:
            presenter.navigationController?.present(viewController, animated: true, completion: nil)
        }
    }
}
