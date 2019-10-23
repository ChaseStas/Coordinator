//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright (c) ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//

import Coordinator

protocol ___VARIABLE_sceneName___FactoryProtocol {
    func makeMainView() -> ___VARIABLE_sceneName___ViewOutput
}

struct ___VARIABLE_sceneName___Factory: Factory, ___VARIABLE_sceneName___FactoryProtocol {
    var storyboard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: nil)
    }
    
    func makeMainView() -> ___VARIABLE_sceneName___ViewOutput {
        storyboard.instantiateViewController(withIdentifier: "___VARIABLE_sceneName___ViewController") as! ___VARIABLE_sceneName___ViewOutput
    }
    
}

