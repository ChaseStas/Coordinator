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
    private let router: Router
    
    init(navigationController: BaseView) {
        self.router = Router(navigationController)
        super.init()
    }
    
    override func start() {
        goToACoordinator()
    }
    
    func goToACoordinator() {
        let coord = ACoordinator()
        addChildAndStart(coord)
        router.setRoot(coord.router.toPresent())
    }
}
