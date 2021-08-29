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
    
    func tapOnAddChecklistButton() {
        addChecklistButton.tap()
    }
    
    func removeFirstChecklist() {
        super.deleteTableCellBySwipe(cell: checklistCells.element(boundBy: 0))
    }
}
