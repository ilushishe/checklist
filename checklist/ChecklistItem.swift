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
    
    func toggleChecked(){
        checked = !checked
    }
}
