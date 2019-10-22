//
//  BaseCoordinator.swift
//  Coordinator
//
//  Created by Stas Parechyn on 10/5/19.
//  Copyright © 2019 StasParechyn. All rights reserved.
//
import UIKit

open class BaseCoordinator<T:CaseIterable & Hashable>: Coordinator, DeallocallableProtocol {
    public var childCoordinators: [Coordinator] = []
    public var onFinish: ((Coordinator) -> Void)?
    public var router: Router!
    
    weak var deallocallable: Deinitcallable?
    
    public init(){}
    
    open func start(_ option: T? = nil) {}
    
    open func addChildAndStart(_ coordinator: BaseCoordinator, _ option: T? = nil) {
        self.addChild(coordinator)
        coordinator.start(option)
    }
    
    deinit {
        log("Coordinator \(self) deallocated😏")
    }
}

public extension BaseCoordinator {
    /// sets the key Deallocallable object for a coordinator, this enables dealloaction of the coordinator once the object gets deallocated via onDeinit closure, only one key object can be active at a time. Calling this func multiple times in the life cycle of a coordinator will just replace previous key object
     func setDeallocallable(with object: BaseView) {
        guard let object = object as? Deinitcallable else {
            log("🧐 setDeallocallable called, but object isn't conform to Deinitcallable")
            return
        }
        deallocallable?.onDeinit = nil
        object.onDeinit = { [weak self] in
            guard let this = self else { return }
            this.onFinish?(this)
        }
        deallocallable = object
    }
}
