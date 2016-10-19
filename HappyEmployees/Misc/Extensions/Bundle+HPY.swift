//
//  Bundle+HPY.swift
//  HappyEmployees
//
//  Created by Szabolcs Toth on 2016. 10. 19..
//  Copyright © 2016. Szabolcs Toth. All rights reserved.
//

import Foundation

protocol BundleType {
    func url(forJSONFileResource name: String) -> URL?
}

extension Bundle: BundleType {
    func url(forJSONFileResource name: String) -> URL? {
        return url(forResource: name, withExtension: "json")
    }
}
