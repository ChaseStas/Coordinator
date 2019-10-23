//
//  NSObject+className.swift
//  Coordinator
//
//  Created by Stas Parechyn on 6/18/19.
//  Copyright © 2019 Axora. All rights reserved.
//

import Foundation

public extension NSObject {
    class var nameOfClass: String {
        return NSStringFromClass(self).components(separatedBy: ".").last!
    }
}
