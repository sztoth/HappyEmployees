//
//  CurrencyConverter.swift
//  HappyEmployees
//
//  Created by Szabolcs Toth on 2016. 10. 19..
//  Copyright © 2016. Szabolcs Toth. All rights reserved.
//

import Foundation

class CurrencyConverter {
    fileprivate let rates: [ExchangeRate]
    fileprivate let baseCurrency: Currency

    init(rates: [ExchangeRate], baseCurrency: Currency) {
        self.rates = rates
        self.baseCurrency = baseCurrency
    }
}

// MARK: - Public method

extension CurrencyConverter {
    func convert(amountInBaseCurrency amount: Double, toAmountInCurrency currency: Currency) -> Double? {
        guard baseCurrency != currency else { return amount }
        guard let rate = rates.filter({ $0.currency == currency }).first?.rate, 0.0 < rate else { return nil }

        return amount / rate
    }
}
