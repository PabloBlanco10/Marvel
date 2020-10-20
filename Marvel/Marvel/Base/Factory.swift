//
//  Factory.swift
//  Marvel
//
//  Created by Pablo Blanco Peris on 19/10/2020.
//  Copyright © 2020 pbp. All rights reserved.
//

import Foundation
import UIKit

protocol FactoryArguments { }

struct Empty : FactoryArguments { }

protocol ViewControllerFactory: class {

    associatedtype Dependencies: FactoryArguments
    var viewController: (Dependencies) -> UIViewController { get }
    
}
