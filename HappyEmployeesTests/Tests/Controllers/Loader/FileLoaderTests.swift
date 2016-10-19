//
//  FileLoaderTests.swift
//  HappyEmployees
//
//  Created by Szabolcs Toth on 2016. 10. 19..
//  Copyright © 2016. Szabolcs Toth. All rights reserved.
//

import XCTest

@testable import HappyEmployees

class FileLoaderTests: XCTestCase {}

// MARK: - Path handling tests

extension FileLoaderTests {
    func test_ShouldHandleFileRelatedPath() {
        XCTAssertTrue(FileLoader.canHandle(path: "file:///some-path"))
    }

    func test_OnlyHandlesFiles() {
        XCTAssertFalse(FileLoader.canHandle(path: "http://some-path"))
        XCTAssertFalse(FileLoader.canHandle(path: "https://some-path"))
    }
}

// MARK: - Loading tests

extension FileLoaderTests {
    func test_LoadFromExistingFile() {
        let exp = expectation(description: "existing file loading")

        let url = Bundle.main.url(forJSONFileResource: "employees")!
        let sut = FileLoader(path: url.absoluteString)
        sut.load { data in
            XCTAssertNotNil(data)

            exp.fulfill()
        }

        waitForExpectations(timeout: 5.0) { error in
            XCTAssertNil(error)
        }
    }

    func test_FailsToLoadNonExistingFile() {
        let exp = expectation(description: "non existing file loading")

        let sut = FileLoader(path: "file:///non-existing-file-path")
        sut.load { data in
            XCTAssertNil(data)

            exp.fulfill()
        }

        waitForExpectations(timeout: 5.0) { error in
            XCTAssertNil(error)
        }
    }
}
