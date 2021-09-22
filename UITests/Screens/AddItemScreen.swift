//
//  AddItem.swift
//  UITests
//
//  Created by Ilya Kozlov on 25.08.2021.
//  Copyright © 2021 i.y.kozlov. All rights reserved.
//

import Foundation
import XCTest

class AddItemScreen: TestBase  {
    
    // MARK: - elements
    
    var nameOfItemTextfield: XCUIElement {app.textFields["name_of_item_textfield"]}
    var remindMeSwitcher: XCUIElement {app.switches["remind_me_switcher"]}
    var dueDateLabel: XCUIElement {app.staticTexts["Due Date"]}
    var datePicker: XCUIElement {app.otherElements["Date and Time Picker"]}
    var doneButton: XCUIElement {app.buttons["done_barbutton"]}

    
    // MARK: - actions
    @discardableResult
    func typeChecklistName(text: String) -> Self {
        nameOfItemTextfield.tap()
        nameOfItemTextfield.typeText(text)
        return self
    }
    
    @discardableResult
    func tapOnRemindMeSwtcher() -> Self {
        remindMeSwitcher.tap()
        return self
    }
    
    @discardableResult
    func setDueDate() -> Self {
        dueDateLabel.tap()
        datePicker.tap()
        return self
    }
    
    @discardableResult
    func saveItem() -> Self {
        doneButton.tap()
        return self
    }
    
    @discardableResult
    func closeDatePickerBySwipeDown() -> Self {
        app.swipeDown()
        return self
    }
    
    @discardableResult
    func chooseDayInDatePicker(day: String) -> Self {
        app.buttons[day].tap()
        return self
    }
}
