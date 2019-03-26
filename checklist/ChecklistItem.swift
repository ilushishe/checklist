//
//  ChecklistItem.swift
//  checklist
//
//  Created by i.y.kozlov on 13/11/2018.
//  Copyright © 2018 i.y.kozlov. All rights reserved.
//

import Foundation

class CheckListItem : NSObject, Codable {
    var text = ""
    var checked = false
    var dueDate = Date()
    var shouldRemind = false
    var itemID: Int
    
    init(text: String = "", checked: Bool = false) {
        self.text = text
        self.checked = checked
        itemID = DataModel.nextChecklistItemID()
        super.init()
    }
    
    func toggleChecked(){
        checked = !checked
    }
}
