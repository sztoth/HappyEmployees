//
//  DataLoader.swift
//  HappyEmployees
//
//  Created by Szabolcs Toth on 2016. 10. 19..
//  Copyright © 2016. Szabolcs Toth. All rights reserved.
//

import Foundation

// This protocol can be used for a future network load option too.
protocol DataLoader {
    init(path: String)
    func load(completion: @escaping (Data?) -> ())
}
