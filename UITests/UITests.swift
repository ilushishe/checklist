//
//  UITests.swift
//  UITests
//
//  Created by Ilya Kozlov on 29.07.2021.
//  Copyright © 2021 i.y.kozlov. All rights reserved.
//

import XCTest

class UITests: TestBase {

    func testExample() throws {
        app.buttons["AddBarButtonItem"].tap()
        app.textFields["nameOfTheListTextField"].typeText("test")
        app.cells["IconCell"].tap()
        app.cells["IdeaIcon"].tap()
        app.buttons["DoneBarButtonItem"].tap()
        XCTAssert( app.cells.staticTexts["test"].exists, "pupa lupa")
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
