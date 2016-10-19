//
//  EmployeeResource.swift
//  HappyEmployees
//
//  Created by Szabolcs Toth on 2016. 10. 19..
//  Copyright © 2016. Szabolcs Toth. All rights reserved.
//

import Foundation

struct EmployeeResource: Resource {
    typealias Model = [Employee]

    func model(fromDictionary dictionary: [String : AnyObject]) -> [Employee]? {
        let items = dictionary["items"] as? [[String : AnyObject]]
        return items?.flatMap(Employee.init)
    }
}
