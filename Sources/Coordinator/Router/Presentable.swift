//
//  Presentable.swift
//  Coordinator
//
//  Created by Stas Parechyn on 10/8/19.
//  Copyright © 2019 StasParechyn. All rights reserved.
//
import UIKit

public protocol Presentable {
    func toPresent() -> UIViewController
}

extension UIViewController: Presentable {
    public func toPresent() -> UIViewController {
        return self
    }
}
