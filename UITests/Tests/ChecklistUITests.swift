//
//  UITests.swift
//  UITests
//
//  Created by Ilya Kozlov on 29.07.2021.
//  Copyright © 2021 i.y.kozlov. All rights reserved.
//

import XCTest

class ChecklistUITests: TestBase {
    
    let allListsScreen = AllListsScreen()
    let addCheckListScreen = AddChecklistScreen()
    let chooseIconScreen = ChooseIconScreen()

    func testCreateCheckListWithChosingIcon() throws {
        
        allListsScreen
            .tapOnAddChecklistButton()
        
        addCheckListScreen
            .typeChecklistName(text: TestData.Texts.checklistName)
            .tapOnTheChooseIconButton()
        
        chooseIconScreen
            .chooseIcon(icon: TestData.Icons.loupe)
        
        addCheckListScreen
            .saveCheckList()
        
        XCTAssert(allListsScreen.checklistCells.staticTexts[TestData.Texts.checklistName].exists, "Созданный чеклист не отображается")
    }
    
    func testDeleteCheckList() {

        allListsScreen
            .tapOnAddChecklistButton()
        
        addCheckListScreen
            .typeChecklistName(text: TestData.Texts.checklistName)
            .saveCheckList()
        
        allListsScreen
            .removeFirstChecklist()
        
        XCTAssert(allListsScreen.checklistCells.count == 0, "Чеклист не удален")
    }
}
