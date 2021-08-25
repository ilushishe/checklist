//
//  UITests.swift
//  UITests
//
//  Created by Ilya Kozlov on 29.07.2021.
//  Copyright © 2021 i.y.kozlov. All rights reserved.
//

import XCTest

class UITests: TestBase {

    func testCreateCheckListWithCHosingIcon() throws {
        let allListsScreen = AllLists()
        let addCheckListScreen = AddChecklist()
        let chooseIconScreen = ChooseIcon()
        
        
        allListsScreen.tapOnAddChecklistButton()
        addCheckListScreen.fillCheckListNameTextField()
        addCheckListScreen.tapOnTheChooseIconButton()
        chooseIconScreen.chooseIcon()
        addCheckListScreen.saveCheckList()

        //вот тут тоже надо подумать как передовать текст для ассерта
        XCTAssert( app.cells.staticTexts["My Test Name For Check List"].exists, "Созданный чеклист не отображается")
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
