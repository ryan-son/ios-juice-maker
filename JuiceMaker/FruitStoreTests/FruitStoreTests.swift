//
//  FruitStoreTests.swift
//  FruitStoreTests
//
//  Created by Ryan-Son on 2022/02/15.
//

import XCTest
@testable import JuiceMaker

class FruitStoreTests: XCTestCase {

    private var sut: FruitStoreType?

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = FruitStore()
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }

    func test_인스턴스_생성_시_과일의_초기값은_10개이다() throws {
        let expectedCount = 10

        Fruit.allCases.forEach { fruit in
            XCTAssertEqual(sut?.count(of: fruit), expectedCount)
        }
    }
}