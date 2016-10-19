//
//  MockLoader.swift
//  HappyEmployees
//
//  Created by Szabolcs Toth on 2016. 10. 19..
//  Copyright © 2016. Szabolcs Toth. All rights reserved.
//

import Foundation

@testable import HappyEmployees

class MockLoader {
    var completion: ((Data?) -> ())?

    required init(path: String) {}
}

extension MockLoader: DataLoader {
    static func canHandle(path: String) -> Bool {
        return true
    }

    func load(completion: @escaping (Data?) -> ()) {
        self.completion = completion
    }
}
