//
//  JuiceOrderViewModel.swift
//  JuiceMaker
//
//  Created by Ryan-Son on 2022/02/19.
//

final class JuiceOrderViewModel: JuiceOrderViewBindable {
    private let juiceMaker: JuiceMakeable

    var juiceOrderButtonTapped: ((Juice) -> Void)?

    init(juiceMaker: JuiceMakeable = JuiceMaker()) {
        self.juiceMaker = juiceMaker
    }

    func count(of fruit: Fruit) -> String {
        return "\(juiceMaker.count(of: fruit))"
    }

    func juiceOrderButtonTapped(for juice: Juice) -> Result<String, JuiceMakerError> {
        let result = juiceMaker.make(juice: juice)
        switch result {
        case .success(let juice):
            return .success("\(juice) 쥬스 나왔습니다.")
        case .failure(let error):
            return .failure(error)
        }
    }
}
