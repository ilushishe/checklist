//
//  ChooseIcon.swift
//  UITests
//
//  Created by Ilya Kozlov on 25.08.2021.
//  Copyright © 2021 i.y.kozlov. All rights reserved.
//

import Foundation
import XCTest

class ChooseIconScreen: TestBase {
    
    // MARK: - elements
    
    var iconCells: XCUIElementQuery {app.cells}
    
    // MARK: - actions
    
    @discardableResult
    func chooseIcon(icon: String) -> Self {
        iconCells[icon].tap()
        return self
    }
}
