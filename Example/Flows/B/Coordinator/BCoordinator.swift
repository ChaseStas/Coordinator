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
            self?.goToA1()
        }
        self.setDeallocallable(with: view)
        self.router = Router(rootForNavController: view)
    }
}

private extension BCoordinator {
    func goToA1() {
        let view = factory.makeB1View()
        router.push(view)
    }
}
