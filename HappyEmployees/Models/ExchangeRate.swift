//
//  ExchangeRate.swift
//  HappyEmployees
//
//  Created by Szabolcs Toth on 2016. 10. 19..
//  Copyright © 2016. Szabolcs Toth. All rights reserved.
//

import Foundation

struct ExchangeRate {
    let rate: Double
    let currency: Currency
}

// MARK: - Decodable protocol

extension ExchangeRate: Decodable {
    init?(dictionary: [String : AnyObject]) {
        guard
            let rate = dictionary["rate"] as? NSNumber,
            let currency = Currency(string: dictionary["currency"] as? String)
        else {
            return nil
        }

        self.rate = rate.doubleValue
        self.currency = currency
    }
}
