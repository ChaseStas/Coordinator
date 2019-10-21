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

enum DeepLinkOption: CaseIterable {
    case aScreen
}

final class ApplicationCoordinator: BaseCoordinator<DeepLinkOption> {
    private weak var window: UIWindow?
    
    init(window: UIWindow?) {
        self.window = window
        super.init()
    }
    
    override func start(_ option: DeepLinkOption? = nil) {
        let coord = ACoordinator()
        addChildAndStart(coord, option)
        
        self.window?.rootViewController = coord.router.toPresent()
        self.window?.makeKeyAndVisible()
    }
}
