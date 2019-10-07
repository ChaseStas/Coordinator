//
//  CCoordinator.swift
//  Example
//
//  Created by Stas Parechyn on 10/4/19.
//  Copyright © 2019 StasParechyn. All rights reserved.
//

import Foundation
import Coordinator
import UIKit

final class CCoordinator: BaseCoordinator {
    weak var presented: UIViewController?
    init(_ presented: UIViewController?) {
        self.presented = presented
        super.init()
    }
    
    override func start() {
        let b = CViewController()
        b.view.backgroundColor = .yellow
        self.setDeallocallable(with: b)
        self.presented?.present(b, animated: true, completion: nil)
    }
}
