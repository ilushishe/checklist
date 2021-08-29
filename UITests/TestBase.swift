//
//  TestBase.swift
//  UITests
//
//  Created by Ilya Kozlov on 29.07.2021.
//  Copyright © 2021 i.y.kozlov. All rights reserved.
//

import Foundation
import XCTest

class TestBase: XCTestCase {
    
    let app = XCUIApplication()
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        app.launch()
    }

    override func tearDownWithError() throws {
        
    }
    
    func deleteTableCellBySwipe (cell: XCUIElement) {
        let rightOffset = CGVector(dx: 0.95, dy: 0.5)
        let leftOffset = CGVector(dx: 0.05, dy: 0.5)

        let cellFarRightCoordinate = cell.coordinate(withNormalizedOffset: rightOffset)
        let cellFarLeftCoordinate = cell.coordinate(withNormalizedOffset: leftOffset)
        cellFarRightCoordinate.press(forDuration: 0.1, thenDragTo: cellFarLeftCoordinate)
    }
}
