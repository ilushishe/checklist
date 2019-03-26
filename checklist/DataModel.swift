//
//  DataModel.swift
//  checklist
//
//  Created by i.y.kozlov on 05/01/2019.
//  Copyright © 2019 i.y.kozlov. All rights reserved.
//

import Foundation

class DataModel {
    var lists = [Checklist]()
    
    init() {
        loadChecklists()
        registerDefaults()
        handleFirstTime()
    }
    
    var indexForSelectedChecklist: Int {
        get {
            return UserDefaults.standard.integer(forKey: "ChecklistIndex")
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "ChecklistIndex")
            UserDefaults.standard.synchronize()
        }
    }
    
    //MARK: - Save/Load Data methods
    func documetnsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        print(paths[0])
        return paths[0]
    }
    
    func dataFilePath() -> URL {
        return documetnsDirectory().appendingPathComponent("Checklists.plist")
    }
    
    func saveChecklists() {
        let encoder = PropertyListEncoder()
        do {
            let data = try encoder.encode(lists)
            try data.write(to: dataFilePath(), options: Data.WritingOptions.atomic)
        } catch {
            print("Error encoding item array")
        }
    }
    
    func loadChecklists() {
        let path = dataFilePath()
        if let data = try? Data(contentsOf: path) {
            let decoder = PropertyListDecoder()
            do {
                lists = try decoder.decode([Checklist].self, from: data)
                sortChecklists()
            } catch {
                print("Error decoding item array")
            }
        }
    }
    
    func registerDefaults(){
        let dictionary : [String:Any] = ["ChecklistIndex" : -1, "FirstTime": true]
        UserDefaults.standard.register(defaults: dictionary)
    }
    
    func handleFirstTime(){
        let userDefaults = UserDefaults.standard
        let firstTimeFlag = userDefaults.bool(forKey: "FirstTime")
        
        if firstTimeFlag {
            let checklist = Checklist(checklistName: "TempList")
            lists.append(checklist)
            indexForSelectedChecklist = 0
            userDefaults.set(false, forKey: "FirstTime")
            userDefaults.synchronize()
        }
    }
    
    func sortChecklists(){
        lists.sort(by: {checklist1, checklist2 in return checklist1.name.localizedStandardCompare(checklist2.name) == .orderedAscending})
    }
    
    class func nextChecklistItemID() -> Int{
        let userDeafaults = UserDefaults.standard
        let itemID = userDeafaults.integer(forKey: "ChecklistItemID")
        userDeafaults.set(itemID+1, forKey: "ChecklistItemID")
        userDeafaults.synchronize()
        return itemID
    }
}
