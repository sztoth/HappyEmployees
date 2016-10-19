//
//  Double-HPY-Tests.swift
//  HappyEmployees
//
//  Created by Szabolcs Toth on 2016. 10. 19..
//  Copyright © 2016. Szabolcs Toth. All rights reserved.
//

import XCTest

@testable import HappyEmployees

class Double_HPY_Tests: XCTestCase {}

// MARK: - Formatting tests

extension Double_HPY_Tests {
    func test_DefaultFormatIsCorrect() {
        let numbers: [Double] = [1212.12125, 10.3789, 100.00, 987.654]
        let strings = ["1212.12", "10.38", "100.00", "987.65"]

        for (index, number) in numbers.enumerated() {
            let value = number.stringValue()

            XCTAssertEqual(value, strings[index])
        }
    }

    func test_HasCustomNumberOfDecimalPoints() {
        let numbers: [Double] = [1212.12125, 10.3789676, 100, 987.1]
        let strings = ["1212.1213", "10.3790", "100.0000", "987.1000"]

        for (index, number) in numbers.enumerated() {
            let value = number.stringValue(withNumberOfDecimalPlaces: 4)

            XCTAssertEqual(value, strings[index])
        }
    }
}
