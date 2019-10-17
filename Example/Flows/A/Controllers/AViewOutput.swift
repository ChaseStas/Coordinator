//
//  AViewOutput.swift
//  Example
//
//  Created by Stas Parechyn on 10/8/19.
//  Copyright © 2019 StasParechyn. All rights reserved.
//

import Coordinator

protocol AViewOutput: BaseView {
    var onPushTap: (() -> Void)? {get set}
    var onPresentFullScreenTap: (() -> Void)? {get set}
    var onPresentTap: (() -> Void)? {get set}
    var onDismissTap: (() -> Void)? {get set}
}
