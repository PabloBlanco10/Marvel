//
//  FactoryTests.swift
//  MarvelTests
//
//  Created by Pablo Blanco Peris on 20/10/2020.
//  Copyright © 2020 pbp. All rights reserved.
//

import XCTest
@testable import Marvel

class FactoryTests: XCTestCase {
    
    func testCharactersFactory () {
        let router = CharactersRouter(viewControllerFactory: CharactersFactory())
        XCTAssertNotNil(router.viewControllerFactory?.viewController(Empty()))
    }
    
    func testCharacterDetailFactory () {
        let router = CharacterDetailRouter(viewControllerFactory: CharacterDetailFactory())
        XCTAssertNotNil(router.viewControllerFactory?.viewController(CharacterDetailConfiguration(id: 1)))
    }
    
}
