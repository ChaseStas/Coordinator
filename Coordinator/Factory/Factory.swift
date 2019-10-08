//
//  Factory.swift
//  Coordinator
//
//  Created by Stas Parechyn on 10/8/19.
//  Copyright © 2019 StasParechyn. All rights reserved.
//

// Factory for getting access to view
public protocol Factory {
    var storyboard: UIStoryboard {get}
}

/*
protocol FactoryExampleProtocol {
    func makeTestView() -> TestViewOutput
}

struct FactoryExample: Factory, FactoryExampleProtocol {
    var storyboard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: nil)
    }
    func makeTestView() -> TestViewOutput {
        ...
    }
}
*/
