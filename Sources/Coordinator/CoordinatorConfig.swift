//
//  CoordinatorConfig.swift
//  Coordinator
//
//  Created by Stas Parechyn on 10/17/19.
//  Copyright © 2019 StasParechyn. All rights reserved.
//

import Foundation

public struct CoordinatorConfig {
    
    public static var enableLogs: Bool = true
}

@inline(__always) func log(_ obj: Any) {
    CoordinatorConfig.enableLogs ? print(obj) : nil
}
