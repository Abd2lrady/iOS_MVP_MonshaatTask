//
//  Router+RouterProtocol.swift
//  moshaatTask
//
//  Created by Ahmad Abdulrady

import UIKit

extension Router: RouterProtocol {
    
    func push(view: UIViewController,
              animated: Bool) {
        navigator.pushViewController(view,
                                     animated: animated)
    }
    
    func present(view: UIViewController,
                 animated: Bool,
                 completion: (() -> Void)?) {
        navigator.present(view,
                          animated: animated,
                          completion: completion)
    }
    
    func pop(animated: Bool) {
        navigator.popViewController(animated: animated)
    }
    
    func popTo(view: UIViewController,
               animated: Bool) {
        navigator.popToViewController(view,
                                      animated: animated)
    }
    
    func popToRoot(animated: Bool) {
        navigator.popToRootViewController(animated: animated)
    }
    
}
