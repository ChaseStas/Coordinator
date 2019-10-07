//
//  Coordinator.swift
//  Coordinator
//
//  Created by Stas Parechyn on 10/4/19.
//  Copyright © 2019 StasParechyn. All rights reserved.
//

import Foundation
import UIKit

public protocol Coordinator: class {
    func addChild(_ coordinator: Coordinator)
    func removeChild(_ coordinator: Coordinator)
    
    var childCoordinators: [Coordinator] {get set}
    
    func start()
    var onFinish: ((Coordinator) -> Void)? { get set }
}

public extension Coordinator {
    func addChild(_ coordinator: Coordinator) {
        childCoordinators.append(coordinator)
    }
    
    func removeChild(_ coordinator: Coordinator) {
        guard let index = childCoordinators.firstIndex(where: { $0 === coordinator }) else {
            print("Couldn't remove coordinator \(coordinator)")
            return
        }
        childCoordinators.remove(at: index)
    }
}

public protocol Deinitcallable: AnyObject {
    var onDeinit: (() -> Void)? { get set }
}

protocol DeallocallableProtocol: AnyObject {
    func setDeallocallable(with object: Deinitcallable)
    var deallocallable: Deinitcallable? { get set }
}

open class BaseVC: UIViewController, Deinitcallable {
    public var onDeinit: (() -> Void)?
    deinit {
        onDeinit?()
        print("Deinit of \(self)")
    }
}
