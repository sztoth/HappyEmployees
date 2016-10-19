//
//  Wage.swift
//  HappyEmployees
//
//  Created by Szabolcs Toth on 2016. 10. 19..
//  Copyright © 2016. Szabolcs Toth. All rights reserved.
//

import Foundation

struct Wage {
    let amount: Double
    let currency: Currency
}

// MARK: - Decodable protocol

extension Wage: Decodable {
    init?(dictionary: [String : AnyObject]) {
        guard
            let amount = dictionary["amount"] as? NSNumber,
            let currency = Currency(string: dictionary["currency"] as? String)
        else {
            return nil
        }

        self.amount = amount.doubleValue
        self.currency = currency
    }
}

