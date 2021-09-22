//
//  ChecklistDetailScreen.swift
//  UITests
//
//  Created by Ilya Kozlov on 31.08.2021.
//  Copyright © 2021 i.y.kozlov. All rights reserved.
//

import Foundation
import XCTest

class ChecklistDetailScreen: TestBase  {
    
    // MARK: - elements
    
    var addItemButton: XCUIElement {app.buttons["add_item_barbutton"]}
    var itemCells: XCUIElementQuery {app.cells}
    
    // MARK: - actions
    
    @discardableResult
    func tapOnAddItemButton() ->Self {
        addItemButton.tap()
        return self
    }
    
    @discardableResult
    func removeFirstItem() -> Self {
        super.deleteTableCellBySwipe(cell: itemCells.element(boundBy: 0))
        return self
    }
}
