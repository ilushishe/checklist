//
//  AllLists.swift
//  UITests
//
//  Created by Ilya Kozlov on 25.08.2021.
//  Copyright © 2021 i.y.kozlov. All rights reserved.
//

import Foundation
import XCTest

class AllLists: TestBase  {
    
    // MARK: - elements
    
    var addChecklistButton: XCUIElement {
        return app.buttons["add_checklist_barbutton"]
    }
    
    // MARK: - actions
    
    func tapOnAddChecklistButton() {
        addChecklistButton.tap()
    }
}
