//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright (c) ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//

import Coordinator

/*
enum DeepLinkOption: CaseIterable {}
*/

final class ___VARIABLE_sceneName___Coordinator: BaseCoordinator<DeepLinkOption> {
    private let factory: ___VARIABLE_sceneName___FactoryProtocol = ___VARIABLE_sceneName___Factory()
    
    override init() {
        super.init()
    }
    
    override func start(_ option: DeepLinkOption? = nil) {
        let view = factory.makeMainView()
        /*
            view.onButtonTap = { [weak self] in
                // do stuff here
            }
        */
        self.router = Router(rootForNavController: view)
        // make sure to set deallocallable. It trigger onFinish function of presented controller and deinit ___VARIABLE_sceneName___Coordinator
        self.setDeallocallable(with: view)
    }
}
