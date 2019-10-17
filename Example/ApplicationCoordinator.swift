//
//  ApplicationCoordinator.swift
//  Example
//
//  Created by Stas Parechyn on 10/4/19.
//  Copyright © 2019 StasParechyn. All rights reserved.
//

import Foundation
import Coordinator
import UIKit

final class ApplicationCoordinator: BaseCoordinator {
    private weak var window: UIWindow?
    
    init(window: UIWindow?) {
        self.window = window
        super.init()
    }
    
    override func start() {
        let coord = ACoordinator()
        addChildAndStart(coord)
        
        self.window?.rootViewController = coord.router.toPresent()
        self.window?.makeKeyAndVisible()
    }
}
