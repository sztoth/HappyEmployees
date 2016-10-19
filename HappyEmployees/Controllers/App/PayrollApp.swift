//
//  PayrollApp.swift
//  HappyEmployees
//
//  Created by Szabolcs Toth on 2016. 10. 19..
//  Copyright © 2016. Szabolcs Toth. All rights reserved.
//

import Foundation

class PayrollApp {}

// MARK: - Public method

extension PayrollApp {
    func generatePayroll(withDataFrom input: Input, sendResultTo output: Output) {
        guard
            let employeePath = input.getEmployeesEndpoint(),
            let employeeLoader = DataLoaderFactory.loader(forPath: employeePath)
        else {
            output.onPayrollGenerated(salaries: [])
            return
        }

        employeeLoader.load { (data) in
            print("Data: \(data)")
        }
    }
}
