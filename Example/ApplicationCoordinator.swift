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
    
    weak var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        super.init()
    }
    
    override func start() {
        goToACoordinator()
    }
    
    func goToACoordinator() {
        let coord = ACoordinator(self.navigationController)
        addChild(coord)
        coord.start()
    }
}
