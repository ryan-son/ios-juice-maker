//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

final class OrderViewController: UIViewController {
    @IBOutlet weak var strawberryLabel: UILabel!
    @IBOutlet weak var bananaLabel: UILabel!
    @IBOutlet weak var pineappleLabel: UILabel!
    @IBOutlet weak var kiwiLabel: UILabel!
    @IBOutlet weak var mangoLabel: UILabel!
    
    private let juiceMaker: JuiceMakeable = JuiceMaker()

    override func viewDidLoad() {
        super.viewDidLoad()
        setCurrentAmount()
    }
    
    /// 주문할 쥬스 선택버튼
    @IBAction func tagOrderButton(_ sender: UIButton) {
        let selectedJuice = Juice(rawValue: sender.tag) ?? .strawberry
        
        let result = juiceMaker.make(juice: selectedJuice)

        switch result {
        case .success(let juice):
            self.showConfirmAlert(of: "\(juice.description) 쥬스 나왔습니다.")
        case .failure( _):
            self.showConfirmCancelAlert(of: "재료가 모자라요. 재고를 수정할까요?")
        }
    }
}

extension OrderViewController {
    /// 현재 재고량
    private func setCurrentAmount() {
        self.strawberryLabel.text = String(juiceMaker.count(of: .strawberry))
        self.bananaLabel.text = String(juiceMaker.count(of: .banana))
        self.pineappleLabel.text = String(juiceMaker.count(of: .pineapple))
        self.kiwiLabel.text = String(juiceMaker.count(of: .kiwi))
        self.mangoLabel.text = String(juiceMaker.count(of: .mango))
    }
    
    /// 선택한 쥬스 확인 알림
    /// - message : body
    func showConfirmAlert(of message: String) {
        let alert = UIAlertController(title: "알림", message: message, preferredStyle: .alert)
        let alertAction =  UIAlertAction(title: "확인", style: .default) { _ in
            self.setCurrentAmount()
        }
        alert.addAction(alertAction)
        self.present(alert, animated: false)
    }
    
    /// 재고 부족 알림
    /// - message : body
    func showConfirmCancelAlert(of message: String) {
        let alert = UIAlertController(title: "알림", message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "확인", style: .default) { _ in
            self.moveToOtherViewByModalAction(of: "StoreViewController")
        }
        let cancleAction = UIAlertAction(title: "취소", style: .cancel)
        alert.addAction(alertAction)
        alert.addAction(cancleAction)
        self.present(alert, animated: false)
    }
}
