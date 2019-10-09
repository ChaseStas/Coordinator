//
//  BCoordinator.swift
//  Example
//
//  Created by Stas Parechyn on 10/4/19.
//  Copyright © 2019 StasParechyn. All rights reserved.
//

import Foundation
import Coordinator
import UIKit

final class BCoordinator: BaseCoordinator {
    private let factory: BFactoryProtocol = BFactory()
    var router: Router!
    
    override init() {
        super.init()
    }
    
    override func start() {
        let view = factory.makeBView()
        view.onButtonTap = { [weak self] in
            let newCoord = ACoordinator()
            newCoord.onFinish = { [weak self] coord in
                self?.removeChild(coord)
            }
            self?.addChildAndStart(newCoord)
            self?.router.present(newCoord.router)
        }
        self.setDeallocallable(with: view)
        self.router = Router(view)
    }
}
