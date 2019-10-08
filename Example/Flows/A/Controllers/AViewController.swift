//
//  ViewController.swift
//  Example
//
//  Created by Stas Parechyn on 10/4/19.
//  Copyright © 2019 StasParechyn. All rights reserved.
//

import Coordinator

class AViewController: BaseVC, AViewOutput {
    var onButtonTap: (() -> Void)?
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func didTapButton() {
        self.onButtonTap?()
    }
}

