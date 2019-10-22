//
//  Router.swift
//  Coordinator
//
//  Created by Stas Parechyn on 10/8/19.
//  Copyright © 2019 StasParechyn. All rights reserved.
//
import UIKit

final public class Router: Presentable {
    private weak var rootViewController: UIViewController?  {
        return view?.toPresent()
    }
    
    private weak var view: BaseView?
    
    /// Initialize Router with view as root
    public init(_ view: BaseView) {
        self.view = view
    }
    /// Initialize Router with navigation controller and set view as root
    public init(rootForNavController view: BaseView) {
        let nvc = UINavigationController(rootViewController: view.toPresent())
        self.view = nvc
    }
    
    public func toPresent() -> UIViewController {
        return rootViewController!
    }
}

// MARK: - Present&Dismiss
public extension Router {
    func present(_ view: Presentable, animated: Bool = true, presentationStyle: UIModalPresentationStyle? = nil, completion: (() -> Void)? = nil) {
        let v = view.toPresent()
        if let presentationStyle = presentationStyle {
            v.modalPresentationStyle = presentationStyle
        }
        self.rootViewController?.present(view.toPresent(), animated: animated, completion: completion)
    }
    
    func dismiss(animated: Bool = true, completion: (() -> Void)? = nil) {
        self.rootViewController?.dismiss(animated: animated, completion: completion)
    }
}

// MARK: - UINavigationController push&pop
public extension Router {
    private var navigationRootController: UINavigationController {
        guard let nvc = rootViewController as? UINavigationController else {
            guard let nvc = rootViewController?.navigationController else {            fatalError("😱 Your root view controller is not UINavigationController or in navigation controller stack. Fix that and try again 😱")
            }
            return nvc
        }
        return nvc
    }
    
    func push(_ view: Presentable, animated: Bool = true) {
        self.navigationRootController.pushViewController(view.toPresent(), animated: animated)
    }
    
    func pop(animated: Bool = true) {
        self.navigationRootController.popViewController(animated: animated)
    }
    
    func popToRoot(animated: Bool = true) {
        self.navigationRootController.popToRootViewController(animated: animated)
    }
    /// Set view as root of UINavigationController
    func setRoot(_ view: Presentable, hideBar: Bool = false, animated: Bool = false) {
        self.navigationRootController.setNavigationBarHidden(hideBar, animated: false)
        self.navigationRootController.setViewControllers([view.toPresent()], animated: animated)
    }
}

// MARK: - Custom Presentation
public extension Router {
    func customPresent(_ view: Presentable, transition: (_ source: UIViewController,_ target: UIViewController) -> Void) {
        guard let vc = self.rootViewController else {
            fatalError("🥵 Root view controller is nil during custom presentation")
        }
        transition(vc, view.toPresent())
    }
}
