//
//  Currency.swift
//  HappyEmployees
//
//  Created by Szabolcs Toth on 2016. 10. 19..
//  Copyright © 2016. Szabolcs Toth. All rights reserved.
//

import Foundation

enum Currency: String {
    case aud = "AUD"
    case usd = "USD"
    case sgd = "SGD"
}

// MARK: - Custom init

extension Currency {
    init?(string: String?) {
        guard let string = string, let currency = Currency(rawValue: string) else { return nil }
        self = currency
    }
}
