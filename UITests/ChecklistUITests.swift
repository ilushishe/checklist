//
//  UITests.swift
//  UITests
//
//  Created by Ilya Kozlov on 29.07.2021.
//  Copyright © 2021 i.y.kozlov. All rights reserved.
//

import XCTest

class ChecklistUITests: TestBase {

    func testCreateCheckListWithCHosingIcon() throws {
        let allListsScreen = AllListsScreen()
        let addCheckListScreen = AddChecklistScreen()
        let chooseIconScreen = ChooseIconScreen()
        
        
        allListsScreen.tapOnAddChecklistButton()
        addCheckListScreen.typeChecklistName(text: TestData.Texts.checklistName)
        addCheckListScreen.tapOnTheChooseIconButton()
        chooseIconScreen.chooseIcon(icon: TestData.Icons.loupe)
        addCheckListScreen.saveCheckList()

        XCTAssert( app.cells.staticTexts[TestData.Texts.checklistName].exists, "Созданный чеклист не отображается")
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
