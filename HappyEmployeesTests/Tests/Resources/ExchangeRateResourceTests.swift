//
//  ExchangeRateResourceTests.swift
//  HappyEmployees
//
//  Created by Szabolcs Toth on 2016. 10. 19..
//  Copyright © 2016. Szabolcs Toth. All rights reserved.
//

import XCTest

@testable import HappyEmployees

class ExchangeRateResourceTests: XCTestCase {
    fileprivate var sut: ExchangeRateResource!

    fileprivate let mockLoader = MockLoader(path: "")

    override func setUp() {
        super.setUp()

        sut = ExchangeRateResource()
    }
}

// MARK: - Loading tests

extension ExchangeRateResourceTests {
    func test_ExchangeRatesCanBeLoaded() {
        let exp = expectation(description: "exchange rates sucessful load")

        let url = Bundle.main.url(forJSONFileResource: "exchange_rates")!
        let data = try! Data(contentsOf: url)

        sut.fetch(fromLoader: mockLoader) { employees in
            XCTAssertNotNil(employees)

            exp.fulfill()
        }

        mockLoader.completion!(data)

        waitForExpectations(timeout: 5.0) { error in
            XCTAssertNil(error)
        }
    }

    func test_FailsIfDataIsNil() {
        let exp = expectation(description: "exchange rates load from nil data")

        sut.fetch(fromLoader: mockLoader) { employees in
            XCTAssertNil(employees)

            exp.fulfill()
        }

        mockLoader.completion!(nil)

        waitForExpectations(timeout: 5.0) { error in
            XCTAssertNil(error)
        }
    }

    func test_FailsIfDataIsNotAJSONData() {
        let exp = expectation(description: "exchange rates load from non json data")

        sut.fetch(fromLoader: mockLoader) { employees in
            XCTAssertNil(employees)

            exp.fulfill()
        }

        mockLoader.completion!(Data())
        
        waitForExpectations(timeout: 5.0) { error in
            XCTAssertNil(error)
        }
    }
}
