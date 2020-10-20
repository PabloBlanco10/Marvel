//
//  MarvelTests.swift
//  MarvelTests
//
//  Created by Pablo Blanco Peris on 16/10/2020.
//  Copyright © 2020 pbp. All rights reserved.
//

import XCTest
@testable import Marvel

class CharactersTests: XCTestCase {
    
    private var view : CharactersViewController!
    
    override func setUp() {
        view = CharactersViewController(viewModel: CharactersViewModel())
        view.viewDidLoad()
    }
    
    func testViewDidUpdate () {
        let expectation = XCTestExpectation(description: "ViewDidUpdate")
        view.viewModel.updateWith = { _ in expectation.fulfill() }
        view.viewModel.showError = { _ in expectation.fulfill() }
        wait(for: [expectation], timeout: 5)
    }
    
    func testViewDidShowError () {
        let expectation = XCTestExpectation(description: "ViewDidShowErrorCalled")
        provoqueFailure()
        view.viewModel.showError = { _ in expectation.fulfill() }
        wait(for: [expectation], timeout: 5)
    }
    
    func provoqueFailure() {
        view.viewModel.model = CharactersModel(endpoint: .test)
        view.viewModel.observeResponse()
    }
}
