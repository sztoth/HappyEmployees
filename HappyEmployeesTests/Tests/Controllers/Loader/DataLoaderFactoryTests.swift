//
//  DataLoaderFactoryTests.swift
//  HappyEmployees
//
//  Created by Szabolcs Toth on 2016. 10. 19..
//  Copyright © 2016. Szabolcs Toth. All rights reserved.
//

import XCTest

@testable import HappyEmployees

class DataLoaderFactoryTests: XCTestCase {}

// MARK: - Loader lookup tests

extension DataLoaderFactoryTests {
    func test_CanReturnLoader() {
        XCTAssertNotNil(DataLoaderFactory.loader(forPath: "file:///some-path"))
    }

    func test_DoesNotHaveSupportedLoader() {
        XCTAssertNil(DataLoaderFactory.loader(forPath: "nope"))
    }
}
