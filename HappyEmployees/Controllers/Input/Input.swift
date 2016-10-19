//
//  Input.swift
//  HappyEmployees
//
//  Created by Szabolcs Toth on 2016. 10. 19..
//  Copyright © 2016. Szabolcs Toth. All rights reserved.
//

import Foundation

// Here I modified the contract (returning an optional) because we cannot use a unified protocol for the file and url 
// based resource loading. We need to return a location based on the contract. When a file is missing someone has to 
// handle the error. The class implementing this protocol is responsible of handling it. This could be done by throwing 
// and error or returning an optional.
protocol Input {
    func getEmployeesEndpoint() -> String?
    func getExchangeRateEndpoint() -> String?
}
