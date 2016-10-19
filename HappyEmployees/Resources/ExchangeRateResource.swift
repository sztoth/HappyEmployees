//
//  ExchangeRateResource.swift
//  HappyEmployees
//
//  Created by Szabolcs Toth on 2016. 10. 19..
//  Copyright © 2016. Szabolcs Toth. All rights reserved.
//

import Foundation

struct ExchangeRateResource: Resource {
    typealias Model = [ExchangeRate]

    func model(fromDictionary dictionary: [String : AnyObject]) -> [ExchangeRate]? {
        let items = dictionary["items"] as? [[String : AnyObject]]
        return items?.flatMap(ExchangeRate.init)
    }
}
