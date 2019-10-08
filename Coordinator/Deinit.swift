//
//  Deinit.swift
//  Coordinator
//
//  Created by Stas Parechyn on 10/7/19.
//  Copyright © 2019 StasParechyn. All rights reserved.
//

public protocol Deinitcallable: BaseView {
    var onDeinit: (() -> Void)? { get set }
}

protocol DeallocallableProtocol: AnyObject {
    func setDeallocallable(with object: BaseView)
    var deallocallable: Deinitcallable? { get set }
}
