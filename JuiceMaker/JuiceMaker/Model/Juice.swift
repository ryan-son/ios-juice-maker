//
//  Juice.swift
//  JuiceMaker
//
//  Created by Derrick, Ryan-Son on 2022/02/16.
//

/// 쥬스 종류
enum Juice {
    case strawberry
    case banana
    case pineapple
    case kiwi
    case mango
    case strawberryBanana
    case mangoKiwi
}

extension Juice {
    /// 쥬스 종류에 따라 소진될 재료와 수량을 가집니다.
    var ingredients: Fruits {
        return IngredientsDirector.ingredients(for: self)
    }
}

extension Juice: CustomStringConvertible {
    var description: String {
        switch self {
        case .strawberry:
            return "딸기쥬스"
        case .banana:
            return "바나나쥬스"
        case .pineapple:
            return "파인애플쥬스"
        case .kiwi:
            return "키위쥬스"
        case .mango:
            return "망고쥬스"
        case .strawberryBanana:
            return "딸바쥬스"
        case .mangoKiwi:
            return "망키쥬스"
        }
    }
}

/// 소진 될 재료를 생성하는 타입
final class IngredientsBuilder {
    private var ingredients: Fruits = [:]
    
    /// 생성한 재료를 반환합니다.
    ///
    /// - Returns: 재료 반환
    func build() -> Fruits {
        return ingredients
    }
    
    /// 소진될 재료의 이름, 개수를 추가 합니다.
    ///
    /// - Parameters:
    ///     - ingredient : 소진될 재료 이름
    ///     - amount : 소진될 재료의 수량
    ///
    ///  - Returns: self
    func with(ingredient: Fruit, amount: Int) -> IngredientsBuilder {
        self.ingredients.updateValue(amount, forKey: ingredient)
        return self
    }
}

/// 지정된 쥬스를 만들기 위해 소진 될 재료를 생성하는 타입
final class IngredientsDirector {
    /// 지정된 쥬스를 만들기 위해 소진 될 재료를 생성한다.
    ///
    /// - Parameters:
    ///     - juice : 쥬스 이름
    ///
    ///  - Returns: 소진될 재료 이름, 수량
    static func ingredients(for juice: Juice) -> Fruits {
        var builder = IngredientsBuilder()
        
        switch juice {
        case .strawberry:
            builder = builder.with(ingredient: .strawberry, amount: 16)
        case .banana:
            builder = builder.with(ingredient: .banana, amount: 2)
        case .kiwi:
            builder = builder.with(ingredient: .kiwi, amount: 3)
        case .pineapple:
            builder = builder.with(ingredient: .pineapple, amount: 2)
        case .strawberryBanana:
            builder = builder
                .with(ingredient: .strawberry, amount: 10)
                .with(ingredient: .banana, amount: 1)
        case .mango:
            builder = builder.with(ingredient: .mango, amount: 3)
        case .mangoKiwi:
            builder = builder
                .with(ingredient: .mango, amount: 2)
                .with(ingredient: .kiwi, amount: 1)
        }
        
        return builder.build()
    }
}
