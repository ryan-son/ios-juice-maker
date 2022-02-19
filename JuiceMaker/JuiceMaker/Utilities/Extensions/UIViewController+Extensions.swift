//
//  UIViewController+Extensions.swift
//  JuiceMaker
//
//  Created by Derrick kim on 2022/02/19.
//
import UIKit

extension UIViewController {
    /// 다음 View로 이동 합니다.
    /// - identifier : Next ViewController's identifier
    func present(identifier: String) {
        guard let viewController = self.storyboard?.instantiateViewController(withIdentifier: identifier) else {
            return
        }
        viewController.modalTransitionStyle = .coverVertical
        self.present(viewController, animated: true)
    }
}
