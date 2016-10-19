//
//  DefaultConsoleOutput.swift
//  HappyEmployees
//
//  Created by Szabolcs Toth on 2016. 10. 19..
//  Copyright © 2016. Szabolcs Toth. All rights reserved.
//

import Foundation

class DefaultConsoleOutput {}

// MARK: - Output implementation

extension DefaultConsoleOutput: Output {
    func onPayrollGenerated(salaries: [Salary]) {
        guard 0 < salaries.count else {
            print("Something went wrong")
            return
        }

        salaries.forEach { salary in
            print("Name: \(salary.employeeName) | Monthly salary: \(salary.monthlySalary)")
        }
    }
}
