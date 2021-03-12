//
//  redditweaksTests.swift
//  redditweaksTests
//  5.0
//  10.16
//
//  Created by bermudalocket on 6/26/20.
//  Copyright © 2020 bermudalocket. All rights reserved.
//

import XCTest
import Combine
@testable import redditweaks

class redditweaksTests: XCTestCase {

    func testSettings() {
        let state = AppState()
        let binding = state.bindingForFeature(.collapseAutoModerator)
        let currentFeatureState = binding.wrappedValue
        binding.projectedValue.wrappedValue.toggle()
        XCTAssert(currentFeatureState != binding.wrappedValue)
    }

    func testVersionUpdate() {
        let helper = UpdateHelper()
        helper.pollUpdate(forced: true)
    }

    func testSubreddit() throws {
        XCTAssertTrue(true)
    }

    func testGetThreadId() {
        let urlStr = "https://www.reddit.com/r/valheim/comments/lz9n5r/i_can_hold_80_more_wooden_arrows_dammit/"
        guard let id = urlStr.split(separator: "/").dropLast().last else {
            XCTFail()
            return
        }
        let str = String(id)
        XCTAssertEqual(str, "lz9n5r")
    }

}
