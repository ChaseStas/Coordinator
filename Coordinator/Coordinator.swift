//
//  Coordinator.swift
//  Coordinator
//
//  Created by Stas Parechyn on 10/4/19.
//  Copyright © 2019 StasParechyn. All rights reserved.
//

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
    
    func addChildAndStart(_ coordinator: Coordinator) {
        self.addChild(coordinator)
        coordinator.start()
    }
    
    func removeChild(_ coordinator: Coordinator) {
        guard let index = childCoordinators.firstIndex(where: { $0 === coordinator }) else {
            print("Couldn't remove coordinator \(coordinator)")
            return
        }
        childCoordinators.remove(at: index)
    }
}
