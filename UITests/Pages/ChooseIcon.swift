//
//  ChooseIcon.swift
//  UITests
//
//  Created by Ilya Kozlov on 25.08.2021.
//  Copyright © 2021 i.y.kozlov. All rights reserved.
//

import Foundation
import XCTest

class ChooseIcon: TestBase {
    
    // MARK: - elements
    var iconButton: XCUIElement {
    // Может тут динамически выбирать иконку?
        return app.cells["IdeaIcon"]
    }
    
    // MARK: - actions
    
    func chooseIcon() {
        iconButton.tap()
    }
}
