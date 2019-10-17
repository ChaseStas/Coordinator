//
//  ViewController.swift
//  Example
//
//  Created by Stas Parechyn on 10/4/19.
//  Copyright © 2019 StasParechyn. All rights reserved.
//

import Coordinator

class AViewController: BaseVC, AViewOutput {
    var onPushTap: (() -> Void)?
    var onPresentTap: (() -> Void)?
    var onPresentFullScreenTap: (() -> Void)?
    var onDismissTap: (() -> Void)?

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .random()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func didTapPresent() {
        self.onPresentTap?()
    }
    
    @IBAction func didTapPresentFullScreen() {
        self.onPresentFullScreenTap?()
    }
    
    @IBAction func didTapPush() {
        self.onPushTap?()
    }
    
    @IBAction func didTapDismiss() {
        self.onDismissTap?()
    }
}

fileprivate extension UIColor {
    static func random() -> UIColor {
        let r = CGFloat.random(in: 0...1)
        let g = CGFloat.random(in: 0...1)
        let b = CGFloat.random(in: 0...1)
        let color = UIColor(red: r, green: g, blue: b, alpha: 1.0)
        return color
    }
}
