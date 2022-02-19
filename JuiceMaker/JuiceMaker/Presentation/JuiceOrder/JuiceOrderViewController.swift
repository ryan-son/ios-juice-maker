//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

protocol JuiceOrderViewBindable: AnyObject {
    var juiceOrderButtonTapped: ((Juice) -> Void)? { get set }

    func count(of fruit: Fruit) -> String
    func juiceOrderButtonTapped(for juice: Juice) -> Result<String, JuiceMakerError>
}

final class JuiceOrderViewController: UIViewController, StoryboardInstantiatable {
    @IBOutlet private var strawberryLabel: UILabel!
    @IBOutlet private var bananaLabel: UILabel!
    @IBOutlet private var pineappleLabel: UILabel!
    @IBOutlet private var kiwiLabel: UILabel!
    @IBOutlet private var mangoLabel: UILabel!

    private let viewModel: JuiceOrderViewBindable = JuiceOrderViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        setCurrentAmount()
        bind(with: viewModel)
    }

    // MARK: - private methods

    private func bind(with viewModel: JuiceOrderViewBindable) {
        viewModel.juiceOrderButtonTapped = { [weak self] juice in
            guard let result = self?.viewModel.juiceOrderButtonTapped(for: juice) else {
                return
            }
            self?.setCurrentAmount()
            self?.handleOrderResult(result)
        }
    }

    /// 현재 재고량
    private func setCurrentAmount() {
        self.strawberryLabel.text = viewModel.count(of: .strawberry)
        self.bananaLabel.text = viewModel.count(of: .banana)
        self.pineappleLabel.text = viewModel.count(of: .pineapple)
        self.kiwiLabel.text = viewModel.count(of: .kiwi)
        self.mangoLabel.text = viewModel.count(of: .mango)
    }

    /// 선택한 쥬스 확인 알림
    /// - message : body
    private func showConfirmAlert(of message: String) {
        let alert = AlertFactory.make(style: .onlyConfirm, title: "알림", message: message)
        self.present(alert, animated: true)
    }
    
    /// 재고 부족 알림
    /// - message : body
    private func showConfirmCancelAlert(of message: String) {
        let alert = AlertFactory.make(style: .default, title: "알림", message: message) {
            let storeViewController = StoreViewController.instantiate()
            self.present(storeViewController, animated: true)
        }
        self.present(alert, animated: true)
    }

    // MARK: Juice Order Button 처리

    private func handleOrderResult(_ result: Result<String, JuiceMakerError>) {
        switch result {
        case .success(let message):
            self.showConfirmAlert(of: message)
        case .failure(let error):
            self.showConfirmCancelAlert(of: error.message)
        }
    }
    
    @IBAction private func strawberryJuiceOrderButtonTapped(_ sender: UIButton) {
        viewModel.juiceOrderButtonTapped?(.strawberry)
    }

    @IBAction private func bananaJuiceOrderButtonTapped(_ sender: UIButton) {
        viewModel.juiceOrderButtonTapped?(.banana)
    }

    @IBAction private func pineappleJuiceOrderButtonTapped(_ sender: UIButton) {
        viewModel.juiceOrderButtonTapped?(.pineapple)
    }

    @IBAction private func kiwiJuiceOrderButtonTapped(_ sender: UIButton) {
        viewModel.juiceOrderButtonTapped?(.kiwi)
    }

    @IBAction private func mangoJuiceOrderButtonTapped(_ sender: UIButton) {
        viewModel.juiceOrderButtonTapped?(.mango)
    }

    @IBAction private func strawberryBananaJuiceOrderButtonTapped(_ sender: UIButton) {
        viewModel.juiceOrderButtonTapped?(.strawberryBanana)
    }

    @IBAction private func mangoKiwiJuiceOrderButtonTapped(_ sender: UIButton) {
        viewModel.juiceOrderButtonTapped?(.mangoKiwi)
    }
}
