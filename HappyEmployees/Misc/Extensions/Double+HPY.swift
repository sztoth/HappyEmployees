//
//  Double+HPY.swift
//  HappyEmployees
//
//  Created by Szabolcs Toth on 2016. 10. 19..
//  Copyright © 2016. Szabolcs Toth. All rights reserved.
//

import Foundation

extension Double {
    fileprivate static let formatter = CustomNumberFormatter()

    func stringValue(withNumberOfDecimalPlaces count: Int = 2) -> String {
        let formatter = Double.formatter
        formatter.decimalPlaces = count

        return formatter.string(from: NSNumber(value: self)) ?? "\(self)"
    }
}

// MARK: - Custom formatter class

fileprivate class CustomNumberFormatter: NumberFormatter {
    var decimalPlaces: Int = 0 {
        didSet {
            minimumFractionDigits = decimalPlaces
            maximumFractionDigits = decimalPlaces
        }
    }

    override init() {
        super.init()

        decimalSeparator = "."
        roundingMode = .halfUp
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        decimalSeparator = "."
        roundingMode = .halfUp
    }
}
