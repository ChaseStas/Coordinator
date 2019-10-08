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
    private let router: Router
    init(_ router: Router) {
        self.router = router
        super.init()
    }
    
    override func start() {
        let view = factory.makeMainView()
        view.onButtonTap = { [weak self] in
            self?.goToNextScreen()
        }
        self.setDeallocallable(with: view)
        router.setRoot(view)
    }
}

private extension ACoordinator {
    func goToNextScreen() {
        let newCoord = BCoordinator()
        self.addChild(newCoord)
        newCoord.onFinish = { [weak self] coord in
            self?.removeChild(coord)
        }
        newCoord.start()
        router.present(newCoord.router)
        
    }
}
