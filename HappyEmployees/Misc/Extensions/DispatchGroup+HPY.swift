//
//  DispatchGroup+HPY.swift
//  HappyEmployees
//
//  Created by Szabolcs Toth on 2016. 10. 19..
//  Copyright © 2016. Szabolcs Toth. All rights reserved.
//

import Foundation

extension DispatchGroup {
    func performWhenFinished(work: @escaping @convention(block) () -> ()) {
        notify(queue: DispatchQueue.global(), execute: work)
    }
}
