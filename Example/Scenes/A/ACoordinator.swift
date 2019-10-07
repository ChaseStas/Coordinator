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
    weak var nvc: UINavigationController?
    init(_ nvc: UINavigationController?) {
        self.nvc = nvc
        super.init()
    }
    
    override func start() {
        let a = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "AViewController") as! AViewController
        a.onButtonTap = { [weak self, weak a] in
            self?.startNextScreen(a)
        }
        self.setDeallocallable(with: a)
        nvc?.setViewControllers([a], animated: false)
    }
}

private extension ACoordinator {
    func startNextScreen(_ a: UIViewController?) {
        let newCoord = BCoordinator(a)
        self.addChild(newCoord)
        newCoord.onFinish = { [weak self] coord in
            self?.removeChild(coord)
        }
        newCoord.start()
    }
}
