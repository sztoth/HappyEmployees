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
        guard let employeePath = input.getEmployeesEndpoint() else {
            output.onPayrollGenerated(salaries: [])
            return
        }

        let fileLoader = FileLoader(path: employeePath)
        fileLoader.load { (data) in
            print("Data: \(data)")
        }
    }
}
