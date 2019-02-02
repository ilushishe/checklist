//
//  Checklist.swift
//  checklist
//
//  Created by i.y.kozlov on 20/12/2018.
//  Copyright © 2018 i.y.kozlov. All rights reserved.
//

import UIKit

class Checklist: NSObject, Codable {
    var name = ""
    var iconName = ""
    var items = [CheckListItem]()
    init(checklistName name : String, chelistIcon icon : String = "loupe") {
        self.name = name
        self.iconName = icon
        super.init()
    }
    
    func countUncheckedItems() -> Int {
        var count = 0
        for item in items where !item.checked {
            count += 1
        }
        return count
    }
}
