//
//  BaseVC.swift
//  Coordinator
//
//  Created by Stas Parechyn on 10/7/19.
//  Copyright © 2019 StasParechyn. All rights reserved.
//
import UIKit

open class BaseVC: UIViewController, Deinitcallable {
    public var onDeinit: (() -> Void)?
    
    deinit {
        onDeinit?()
        log("Deinit of \(self)")
    }
}

open class BaseTVC: UITableViewController, Deinitcallable {
    public var onDeinit: (() -> Void)?
    
    deinit {
        onDeinit?()
        log("Deinit of \(self)")
    }
}

open class BaseTBC: UITabBarController, Deinitcallable {
    public var onDeinit: (() -> Void)?
    
    deinit {
        onDeinit?()
        log("Deinit of \(self)")
    }
}
