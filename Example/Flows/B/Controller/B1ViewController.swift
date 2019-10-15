//
//  B1ViewController.swift
//  Example
//
//  Created by Stas Parechyn on 10/16/19.
//  Copyright © 2019 StasParechyn. All rights reserved.
//

import Coordinator

protocol B1ViewOutput: BaseView {
    
}

class B1ViewController: BaseVC, B1ViewOutput {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .purple
    }
}
