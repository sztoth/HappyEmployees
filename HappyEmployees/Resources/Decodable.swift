//
//  Decodable.swift
//  HappyEmployees
//
//  Created by Szabolcs Toth on 2016. 10. 19..
//  Copyright © 2016. Szabolcs Toth. All rights reserved.
//

import Foundation

protocol Decodable {
    init?(dictionary: [String : AnyObject])
}
