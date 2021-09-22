//
//  AllLists.swift
//  UITests
//
//  Created by Ilya Kozlov on 25.08.2021.
//  Copyright © 2021 i.y.kozlov. All rights reserved.
//

import Foundation
import XCTest

class AllListsScreen: TestBase  {
    
    // MARK: - elements
    
    var addChecklistButton: XCUIElement {app.buttons["add_checklist_barbutton"]}
    var checklistCells: XCUIElementQuery {app.cells}
    
    // MARK: - actions
    
    @discardableResult
    func tapOnAddChecklistButton() ->Self {
        addChecklistButton.tap()
        return self
    }
    
    @discardableResult
    func removeFirstChecklist() -> Self {
        super.deleteTableCellBySwipe(cell: checklistCells.element(boundBy: 0))
        return self
    }
    
    @discardableResult
    func openChecklist(name: String) -> Self {
        checklistCells.staticTexts[name].tap()
        return self
    }
}
