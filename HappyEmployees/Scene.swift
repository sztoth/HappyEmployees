//
//  Scene.swift
//  HappyEmployees
//
//  Created by Szabolcs Toth on 2016. 10. 19..
//  Copyright © 2016. Szabolcs Toth. All rights reserved.
//

import UIKit

class Scene: NSObject {
    fileprivate let payrollApp = PayrollApp()
}

extension Scene: UIApplicationDelegate {
    func applicationDidFinishLaunching(_ application: UIApplication) {
        let input = DefaultFileInput()
        let output = DefaultConsoleOutput()
        payrollApp.generatePayroll(withDataFrom: input, sendResultTo: output)
    }
}
