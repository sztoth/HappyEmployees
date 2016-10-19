//
//  Resource.swift
//  HappyEmployees
//
//  Created by Szabolcs Toth on 2016. 10. 19..
//  Copyright © 2016. Szabolcs Toth. All rights reserved.
//

import Foundation

protocol Resource {
    associatedtype Model

    func fetch(fromLoader loader: DataLoader, withCompletion completion: @escaping (Model?) -> ())
    func model(fromDictionary dictionary: [String : AnyObject]) -> Model?
    func model(fromArray array: [AnyObject]) -> Model?
}

// MARK: - Default implementation

extension Resource {
    func fetch(fromLoader loader: DataLoader, withCompletion completion: @escaping (Model?) -> ()) {
        loader.load { data in
            guard let data = data, let jsonObject = try? JSONSerialization.jsonObject(with: data, options: []) else {
                completion(nil)
                return
            }

            if let dictionary = jsonObject as? [String : AnyObject] {
                completion(self.model(fromDictionary: dictionary))
                return
            }

            if let array = jsonObject as? [AnyObject] {
                completion(self.model(fromArray: array))
                return
            }

            completion(nil)
        }
    }

    func model(fromDictionary dictionary: [String : AnyObject]) -> Model? {
        return nil
    }

    func model(fromArray array: [AnyObject]) -> Model? {
        return nil
    }
}
