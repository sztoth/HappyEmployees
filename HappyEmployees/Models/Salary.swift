//
//  Salary.swift
//  HappyEmployees
//
//  Created by Szabolcs Toth on 2016. 10. 19..
//  Copyright © 2016. Szabolcs Toth. All rights reserved.
//

import Foundation

// I would have used a struct here, but the contract specified a class.
class Salary {
    let employeeName: String
    let monthlySalary: String

    init(employeeName: String, monthlySalary: String) {
        self.employeeName = employeeName
        self.monthlySalary = monthlySalary
    }
}
