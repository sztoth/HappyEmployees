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
        let exchangeRateResource = ExchangeRateResource()
        let executionGroup = DispatchGroup()

        var employees: [Employee]?
        var exchangeRates: [ExchangeRate]?

        executionGroup.enter()
        employeeResource.fetch(fromLoader: employeeLoader) { employeeList in
            employees = employeeList
            executionGroup.leave()
        }

        executionGroup.enter()
        exchangeRateResource.fetch(fromLoader: exchangeRateLoader) { exchangeRateList in
            exchangeRates = exchangeRateList
            executionGroup.leave()
        }

        executionGroup.performWhenFinished { 
            guard let employees = employees, let exchangeRates = exchangeRates else {
                output.onPayrollGenerated(salaries: [])
                return
            }

            let salaries = self.processSalaries(forEmployees: employees, withExchangeRates: exchangeRates)
            output.onPayrollGenerated(salaries: salaries)
        }
    }
}

// MARK: - Calculation

fileprivate extension PayrollApp {
    func processSalaries(forEmployees employess: [Employee], withExchangeRates rates: [ExchangeRate]) -> [Salary] {
        let converter = CurrencyConverter(rates: rates, baseCurrency: .aud)

        var salaries = [Salary]()
        for (_, employee) in employess.enumerated() {
            let monthlyCurrency = employee.requestedCurrency
            let monthlyAmount = employee.annualWage.amount / 12.0
            guard let convertedAmount = converter.convert(amountInBaseCurrency: monthlyAmount, toAmountInCurrency: monthlyCurrency) else {
                return []
            }

            let monthlySalary = "\(monthlyCurrency.rawValue) \(convertedAmount.stringValue())"
            let salary = Salary(employeeName: employee.fullName, monthlySalary: monthlySalary)
            salaries.append(salary)
        }

        return salaries
    }
}
