//
//  PayrollAppTests.swift
//  HappyEmployees
//
//  Created by Szabolcs Toth on 2016. 10. 19..
//  Copyright © 2016. Szabolcs Toth. All rights reserved.
//

import XCTest

@testable import HappyEmployees

class PayrollAppTests: XCTestCase {
    fileprivate var payrollApp: PayrollApp!

    override func setUp() {
        super.setUp()

        payrollApp = PayrollApp()
    }
}

// MARK: - Main logic test

extension PayrollAppTests {
    func testWhenGeneratePayrollCalled_thenSalaryListIsReturned() {
        let exp = expectation(description: "payroll calculation")

        let input = DefaultFileInput()
        let output = TestOutput()
        output.completion = { salaries in
            XCTAssertTrue(salaries.count == 6)

            let expectedValues: [(String, String)] = [
                ("Joan Smith", "USD 2235.51"),
                ("Dan White", "AUD 2083.33"),
                ("Billy Davis", "AUD 1250.00"),
                ("Jenny Black", "AUD 1250.00"),
                ("Peter Brown", "AUD 2916.67"),
                ("Mary Day", "SGD 3482.36")
            ]
            for (index, salary) in salaries.enumerated() {
                let expected = expectedValues[index]
                XCTAssertEqual(salary.employeeName, expected.0)
                XCTAssertEqual(salary.monthlySalary, expected.1)
            }

            exp.fulfill()
        }

        payrollApp.generatePayroll(withDataFrom: input, sendResultTo: output)

        waitForExpectations(timeout: 5.0) { error in
            XCTAssertNil(error)
        }
    }
}

// MARK: - Mock

fileprivate extension PayrollAppTests {
    class TestOutput: Output {
        var completion: (([Salary]) -> ())?

        func onPayrollGenerated(salaries: [Salary]) {
            completion?(salaries)
        }
    }
}
