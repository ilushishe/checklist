//
//  AddChecklist.swift
//  UITests
//
//  Created by Ilya Kozlov on 25.08.2021.
//  Copyright © 2021 i.y.kozlov. All rights reserved.
//

import Foundation
import XCTest

class AddChecklist: TestBase  {
    
    // MARK: - elements
    
    var nameOfChecklistTextfield: XCUIElement {
        return app.textFields["name_of_checklist_textfield"]
    }
    
    var chooseIconButton: XCUIElement {
        return app.cells["IconCell"]
    }
    
    
    var doneButton: XCUIElement {
        return app.buttons["done_barbutton"]
    }
    
    
    // MARK: - Actions
    
    //Нужно ли тестовые данные хардкодить в методе?
    func fillCheckListNameTextField() {
        nameOfChecklistTextfield.typeText("My Test Name For Check List")
    }
    
    func tapOnTheChooseIconButton() {
        chooseIconButton.tap()
    }
    

    func saveCheckList() {
        doneButton.tap()
    }
}
