//
//  UIViewController+Extensions.swift
//  JuiceMaker
//
//  Created by Derrick kim on 2022/02/19.
//
import UIKit

protocol StoryboardInstantiatable: AnyObject {
    static var sceneStoryboard: UIStoryboard { get }
}

extension StoryboardInstantiatable {
    static var sceneStoryboard: UIStoryboard {
        return UIStoryboard(name: String(describing: self), bundle: Bundle(for: self))
    }
}

extension StoryboardInstantiatable where Self: UIViewController {
    static func instantiate() -> Self {
        let viewController = sceneStoryboard.instantiateInitialViewController()
        guard let viewController = viewController as? Self else {
            fatalError()
        }
        return viewController
    }
}
