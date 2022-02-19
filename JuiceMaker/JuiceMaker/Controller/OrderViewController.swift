//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class OrderViewController: UIViewController {
    @IBOutlet weak var strawberryLabel: UILabel!
    @IBOutlet weak var bananaLabel: UILabel!
    @IBOutlet weak var pineappleLabel: UILabel!
    @IBOutlet weak var kiwiLabel: UILabel!
    @IBOutlet weak var mangoLabel: UILabel!
    
    let juiceMaker = JuiceMaker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    /// 주문할 쥬스 선택버튼
    @IBAction func tagOrderButton(_ sender: UIButton) {
        let selectedJuice = Juice(rawValue: sender.tag) ?? .strawberry
        
        let result = juiceMaker.make(juice: selectedJuice)

        switch result {
        case .success(let juice):
            break
        case .failure(let notEnoughFruits):
            break
        }
    }
}

extension OrderViewController {
    /// 현재 재고량
    private func setCurrentAmount() {
        strawberryLabel.text = String(juiceMaker.count(of: .strawberry))
        bananaLabel.text = String(juiceMaker.count(of: .banana))
        pineappleLabel.text = String(juiceMaker.count(of: .pineapple))
        kiwiLabel.text = String(juiceMaker.count(of: .kiwi))
        mangoLabel.text = String(juiceMaker.count(of: .mango))
    }
}
