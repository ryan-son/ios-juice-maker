//
//  AlertFactory.swift
//  JuiceMaker
//
//  Created by Ryan-Son on 2022/02/19.
//

import UIKit

struct AlertFactory {

    enum AlertStyle {
        case `default`
        case onlyConfirm
    }

    static func make(
        style: AlertStyle,
        title: String?,
        message: String?,
        confirmAction: (() -> Void)? = nil
    ) -> UIAlertController {
        let alert = UIAlertController(title: "알림", message: message, preferredStyle: .alert)
        let confirmAction =  UIAlertAction(title: "확인", style: .default) { _ in
            confirmAction?()
        }
        alert.addAction(confirmAction)

        switch style {
        case .default:
            let cancelAction = UIAlertAction(title: "취소", style: .cancel)
            alert.addAction(cancelAction)
            return alert
        case .onlyConfirm:
            return alert
        }
    }
}
