//
//  ACoordinator.swift
//  Example
//
//  Created by Stas Parechyn on 10/4/19.
//  Copyright © 2019 StasParechyn. All rights reserved.
//

import Foundation
import Coordinator
import UIKit

final class ACoordinator: BaseCoordinator {
    private let factory: AFactoryProtocol = AFactory()
    var router: Router!
    
    override init() {
        super.init()
    }
    
    override func start() {
        let view = factory.makeMainView()
        view.onButtonTap = { [weak self] in
            self?.goToNextScreen()
        }
        self.router = Router(view)
        self.setDeallocallable(with: view)
    }
}

private extension ACoordinator {
    func goToNextScreen() {
        let newCoord = BCoordinator()
        newCoord.onFinish = { [weak self] coord in
            self?.removeChild(coord)
        }
        self.addChildAndStart(newCoord)
        router.present(newCoord.router)
    }
}
