//
//  AddChecklist.swift
//  UITests
//
//  Created by Ilya Kozlov on 25.08.2021.
//  Copyright © 2021 i.y.kozlov. All rights reserved.
//

import Foundation
import XCTest

class AddChecklistScreen: TestBase  {
    
    // MARK: - elements
    
    var nameOfChecklistTextfield: XCUIElement {app.textFields["name_of_checklist_textfield"]}
    var chooseIconButton: XCUIElement {app.cells["IconCell"]}
    var doneButton: XCUIElement {app.buttons["done_barbutton"]}
    
    // MARK: - Actions
    
    @discardableResult
    func typeChecklistName(text: String) -> Self {
        nameOfChecklistTextfield.tap()
        nameOfChecklistTextfield.typeText(text)
        return self
    }
    
    @discardableResult
    func tapOnTheChooseIconButton() -> Self {
        chooseIconButton.tap()
        return self
    }
    
    @discardableResult
    func saveCheckList() -> Self {
        doneButton.tap()
        return self
    }
}
