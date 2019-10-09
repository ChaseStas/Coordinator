//
//  BFactory.swift
//  Example
//
//  Created by Stas Parechyn on 10/8/19.
//  Copyright © 2019 StasParechyn. All rights reserved.
//

import Coordinator

protocol BFactoryProtocol {
    func makeBView() -> BViewOutput
}

struct BFactory: Factory, BFactoryProtocol {
    var storyboard: UIStoryboard {
        return UIStoryboard(name: "BStoryboard", bundle: nil)
    }
    
    func makeBView() -> BViewOutput {
        storyboard.instantiateViewController(identifier: "BViewController") as! BViewOutput
    }
}
