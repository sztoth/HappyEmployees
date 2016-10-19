//
//  EmployeeResourceTests.swift
//  HappyEmployees
//
//  Created by Szabolcs Toth on 2016. 10. 19..
//  Copyright © 2016. Szabolcs Toth. All rights reserved.
//

import XCTest

@testable import HappyEmployees

class EmployeeResourceTests: XCTestCase {
    fileprivate var sut: EmployeeResource!

    fileprivate let mockLoader = MockLoader(path: "")

    override func setUp() {
        super.setUp()

        sut = EmployeeResource()
    }
}

// MARK: - Loading tests

extension EmployeeResourceTests {
    func test_EmployeesCanBeLoaded() {
        let exp = expectation(description: "employee sucessful load")

        let url = Bundle.main.url(forJSONFileResource: "employees")!
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
        let exp = expectation(description: "employee load from nil data")

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
        let exp = expectation(description: "employee load from non json data")

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
