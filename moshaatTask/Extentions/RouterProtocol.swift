//
//  RouterProtocol.swift
//  moshaatTask
//
//  Created by Ahmad Abdulrady

import UIKit

protocol RouterProtocol {
    func push(view: UIViewController, animated: Bool)
    func present(view: UIViewController, animated: Bool, completion: (() -> Void)?)
    func pop(animated: Bool)
    func popTo(view: UIViewController, animated: Bool)
    func popToRoot(animated: Bool)
}
