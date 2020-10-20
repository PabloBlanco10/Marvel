//
//  RouterTests.swift
//  MarvelTests
//
//  Created by Pablo Blanco Peris on 20/10/2020.
//  Copyright © 2020 pbp. All rights reserved.
//

import XCTest
@testable import Marvel

class RouterTests: XCTestCase {

    func testPushNavigation () {
        let expectation = XCTestExpectation(description: "PushNavigation")
        
        let origin = CharactersFactory().viewController(Empty())
        let navigation = UINavigationController(rootViewController: origin)
        
        let destiny = CharacterDetailRouter(viewControllerFactory: CharacterDetailFactory())
        destiny.navigate(from: origin, arguments: CharacterDetailConfiguration(id: 0), transition: .push)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            XCTAssertEqual(navigation.viewControllers.count, 2)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 2)
    }
}
