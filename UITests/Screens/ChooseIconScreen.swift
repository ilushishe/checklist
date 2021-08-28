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

    func chooseIcon(icon: String) {
        iconCells[icon].tap()
    }
}
