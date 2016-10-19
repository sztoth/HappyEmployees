//
//  DefaultFileInputTests.swift
//  HappyEmployees
//
//  Created by Szabolcs Toth on 2016. 10. 19..
//  Copyright © 2016. Szabolcs Toth. All rights reserved.
//

import XCTest

@testable import HappyEmployees

class DefaultFileInputTests: XCTestCase {
    fileprivate var sut: DefaultFileInput!

    fileprivate let mockBundle = MockBundle()

    override func setUp() {
        super.setUp()

        sut = DefaultFileInput(bundle: mockBundle)
    }
}

// MARK: - Endpoint tests

extension DefaultFileInputTests {
    func test_EmployeeEndpointReturnsAURL() {
        func test_EmployeeEndpointReturnsAURL() {
            let url = URL(string: "http://test.url")!
            mockBundle.url = url

            let value = sut.getEmployeesEndpoint()

            XCTAssertEqual(mockBundle.name!, "employees")
            XCTAssertEqual(value, url.absoluteString)
        }

        func test_ExchangeRateEndpointReturnsAURL() {
            let url = URL(string: "http://test.url")!
            mockBundle.url = url

            let value = sut.getExchangeRateEndpoint()

            XCTAssertEqual(mockBundle.name!, "exchange_rates")
            XCTAssertEqual(value, url.absoluteString)
        }
    }
}

// MARK: - Mock

fileprivate extension DefaultFileInputTests {
    class MockBundle: BundleType {
        var name: String?
        var url: URL?

        func url(forJSONFileResource name: String) -> URL? {
            self.name = name
            return url
        }
    }
}
