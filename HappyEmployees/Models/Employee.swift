//
//  Employee.swift
//  HappyEmployees
//
//  Created by Szabolcs Toth on 2016. 10. 19..
//  Copyright © 2016. Szabolcs Toth. All rights reserved.
//

import Foundation

struct Employee {
    let firstName: String
    let lastName: String
    let department: Department
    let requestedCurrency: Currency
    let annualWage: Wage
}

// MARK: - Decodable protocol

extension Employee: Decodable {
    init?(dictionary: [String : AnyObject]) {
        guard
            let firstName = dictionary["first_name"] as? String,
            let lastName = dictionary["last_name"] as? String,
            let department = Department(string: dictionary["section"] as? String),
            let requestedCurrency = Currency(string: dictionary["currency"] as? String),
            let annualWageDict = dictionary["salary"] as? [String : AnyObject],
            let annualWage = Wage(dictionary: annualWageDict)
        else {
            return nil
        }

        self.firstName = firstName
        self.lastName = lastName
        self.department = department
        self.requestedCurrency = requestedCurrency
        self.annualWage = annualWage
    }
}
