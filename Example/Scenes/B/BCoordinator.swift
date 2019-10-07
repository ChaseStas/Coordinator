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
    weak var nvc: UINavigationController?
    weak var presented: UIViewController?
    
    init(_ presented: UIViewController?) {
        self.presented = presented
        super.init()
    }
    
    override func start() {
        let b = BViewController()
        b.view.backgroundColor = .red
        b.onButtonTap = { [weak self, weak b] in
            let newCoord = BCoordinator(b)
            self?.addChild(newCoord)
            newCoord.onFinish = { [weak self] coord in
                guard let this = self else { return }
                this.removeChild(coord)
            }
            newCoord.start()
        }
        self.setDeallocallable(with: b)
        let nvc = UINavigationController(rootViewController: b)
        self.presented?.present(nvc, animated: true, completion: nil)
        self.nvc = nvc
        
    }
}
