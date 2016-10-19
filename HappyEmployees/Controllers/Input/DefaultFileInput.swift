//
//  DefaultFileInput.swift
//  HappyEmployees
//
//  Created by Szabolcs Toth on 2016. 10. 19..
//  Copyright © 2016. Szabolcs Toth. All rights reserved.
//

import Foundation

class DefaultFileInput {
    let bundle: BundleType

    init(bundle: BundleType = Bundle.main) {
        self.bundle = bundle
    }
}

// MARK: - Input protocol

extension DefaultFileInput: Input {
    func getEmployeesEndpoint() -> String? {
        return bundle.url(forJSONFileResource: "employess")?.absoluteString
    }

    func getExchangeRateEndpoint() -> String? {
        return bundle.url(forJSONFileResource: "exchange_rates")?.absoluteString
    }
}
