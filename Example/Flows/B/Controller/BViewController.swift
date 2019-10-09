//
//  SecondViewController.swift
//  Example
//
//  Created by Stas Parechyn on 10/4/19.
//  Copyright © 2019 StasParechyn. All rights reserved.
//

import UIKit
import Coordinator

class BViewController: BaseVC, BViewOutput {
    var onButtonTap: (() -> Void)?
        
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func didTapButton() {
        onButtonTap?()
    }
}
