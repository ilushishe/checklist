//
//  TestData.swift
//  UITests
//
//  Created by Ilya Kozlov on 28.08.2021.
//  Copyright © 2021 i.y.kozlov. All rights reserved.
//

import Foundation

struct TestData {
    
    struct Texts {
        static let checklistName = "testChecklistName"
        static let itemName = "testItemName"
    }
    
    struct Icons {
        static let loupe = "LoupeIcon"
        static let idea = "IdeaIcon"
    }
    
    struct Dates {
        static var tomorrow: String {
            let tomorrowDate = Calendar.current.date(byAdding: .day, value: 1, to: Date())!
            let formatter = DateFormatter()
            formatter.dateFormat = "EEEE, MMMM dd"
            let tomorrowString = formatter.string(from: tomorrowDate)
            return tomorrowString
        }
    }
}
