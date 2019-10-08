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
    let router: Router
    private let nvc = UINavigationController()
    
    override init() {
        self.router = Router(nvc)
        super.init()
    }
    
    override func start() {
        let view = factory.makeBView()
//        b.onButtonTap = { [weak self, weak b] in
//            let newCoord = BCoordinator(b)
//            self?.addChild(newCoord)
//            newCoord.onFinish = { [weak self] coord in
//                guard let this = self else { return }
//                this.removeChild(coord)
//            }
//            newCoord.start()
//        }
        self.setDeallocallable(with: view)
        self.router.setRoot(view)
        
//        let nvc = UINavigationControl
//        let nvc = UINavigationController(rootViewController: b)
//        self.presented?.present(nvc, animated: true, completion: nil)
//        self.nvc = nvc
    }
}
