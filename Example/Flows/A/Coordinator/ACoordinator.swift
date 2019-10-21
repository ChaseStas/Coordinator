//
//  ACoordinator.swift
//  Example
//
//  Created by Stas Parechyn on 10/4/19.
//  Copyright © 2019 StasParechyn. All rights reserved.
//

import Foundation
import Coordinator
import UIKit

final class ACoordinator: BaseCoordinator<DeepLinkOption> {
    private let factory: AFactoryProtocol = AFactory()
    var router: Router!
    
    override init() {
        super.init()
    }
    
    override func start(_ option: DeepLinkOption? = nil) {
        let view = factory.makeMainView()
        configureMainView(view: view)
        self.router = Router(rootForNavController: view)
        self.setDeallocallable(with: view)
    }
    
    private func configureMainView(view: AViewOutput) {
        view.onPresentTap = { [weak self] in
            self?.goToNextScreen()
        }
        view.onPresentFullScreenTap = { [weak self] in
            self?.goToNextScreen(fullScreen: true)
        }
        view.onPushTap = { [weak self] in
            self?.pushToNewScreen()
        }
        view.onDismissTap = { [weak self] in
            self?.router.dismiss()
        }
    }
}

private extension ACoordinator {
    func goToNextScreen(fullScreen: Bool = false) {
        let newCoord = ACoordinator()
        newCoord.onFinish = { [weak self] coord in
            self?.removeChild(coord)
        }
        self.addChildAndStart(newCoord)
        router.present(newCoord.router, animated: true, presentationStyle: fullScreen ? .fullScreen : .pageSheet, completion: nil)
    }
    
    func pushToNewScreen() {
        let view = factory.makeMainView()
        configureMainView(view: view)
        self.router.push(view)
    }
}
