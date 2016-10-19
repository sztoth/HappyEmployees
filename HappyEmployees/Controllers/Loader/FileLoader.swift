//
//  FileLoader.swift
//  HappyEmployees
//
//  Created by Szabolcs Toth on 2016. 10. 19..
//  Copyright © 2016. Szabolcs Toth. All rights reserved.
//

import Foundation

class FileLoader {
    fileprivate let path: String

    required init(path: String) {
        self.path = path
    }
}

// MARK: - DataLoader protocol

extension FileLoader: DataLoader {
    static func canHandle(path: String) -> Bool {
        return path.hasPrefix("file:///")
    }

    func load(completion: @escaping (Data?) -> ()) {
        DispatchQueue.global().async {
            guard let url = URL(string: self.path), let data = try? Data(contentsOf: url) else {
                completion(nil)
                return
            }

            completion(data)
        }
    }
}
