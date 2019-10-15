//
//  Factory.swift
//  Example
//
//  Created by Stas Parechyn on 10/8/19.
//  Copyright © 2019 StasParechyn. All rights reserved.
//

import Coordinator

protocol AFactoryProtocol {
    func makeMainView() -> AViewOutput
}

struct AFactory: Factory, AFactoryProtocol {
    var storyboard: UIStoryboard {
        return UIStoryboard(name: "AStoryboard", bundle: nil)
    }
    
    func makeMainView() -> AViewOutput {
        storyboard.instantiateViewController(withIdentifier: "AViewController") as! AViewOutput
    }
    
}
