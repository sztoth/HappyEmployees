//
//  DataLoaderFactory.swift
//  HappyEmployees
//
//  Created by Szabolcs Toth on 2016. 10. 19..
//  Copyright © 2016. Szabolcs Toth. All rights reserved.
//

import Foundation

class DataLoaderFactory {
    static let loaders = [FileLoader.self]

    static func loader(forPath path: String) -> DataLoader? {
        guard let type = loaders.filter({ $0.canHandle(path: path) }).first else { return nil }
        return type.init(path: path)
    }
}
