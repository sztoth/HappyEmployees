//
//  Department.swift
//  HappyEmployees
//
//  Created by Szabolcs Toth on 2016. 10. 19..
//  Copyright © 2016. Szabolcs Toth. All rights reserved.
//

import Foundation

enum Department: String {
    case sales = "Sales"
    case administration = "Administration"
    case warehouse = "Warehouse"
    case logistics = "Logistics"
}

// MARK: - Custom init

extension Department {
    init?(string: String?) {
        guard let string = string, let department = Department(rawValue: string) else { return nil }
        self = department
    }
}
