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

        guard
            let exchangeRatePath = input.getExchangeRateEndpoint(),
            let exchangeRateLoader = DataLoaderFactory.loader(forPath: exchangeRatePath)
        else {
            output.onPayrollGenerated(salaries: [])
            return
        }

        let employeeResource = EmployeeResource()
        employeeResource.fetch(fromLoader: employeeLoader) { employees in
            print("Employees: \(employees)")
        }

        let exchangeRateResource = ExchangeRateResource()
        exchangeRateResource.fetch(fromLoader: exchangeRateLoader) { exchangeRates in
            print("Exchange rates: \(exchangeRates)")
        }
    }
}
