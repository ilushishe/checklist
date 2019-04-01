//
//  AddItemTableViewController.swift
//  checklist
//
//  Created by i.y.kozlov on 17/11/2018.
//  Copyright © 2018 i.y.kozlov. All rights reserved.
//

import UIKit

protocol ItemDetailViewControllerDelegate: class {
    func itemDetailViewControllerDidCancel(_ controller: ItemDetailViewController)
    func itemDetailViewController(_ controller: ItemDetailViewController, didFinishAdding item: CheckListItem)
    func itemDetailViewController(_ controller: ItemDetailViewController, didFinishEditing item: CheckListItem)
}

class ItemDetailViewController: UITableViewController, UITextFieldDelegate {
    
    @IBOutlet weak var doneButton: UIBarButtonItem!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var shouldRemindSwitch: UISwitch!
    @IBOutlet weak var dueDateLabel: UILabel!
    @IBOutlet weak var datePickerCell: UITableViewCell!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBAction func dateChanged(_datePicker: UIDatePicker){
        dueDate = datePicker.date
        updateDueDateLabel()
    }
    
    weak var delegate: ItemDetailViewControllerDelegate?
    var itemToEdit : CheckListItem?
    var dueDate = Date()
    var datePickerVisible = false
    
    @IBAction func cancel(){
        delegate?.itemDetailViewControllerDidCancel(self)
    }
    
    @IBAction func done(){
        if let item = itemToEdit {
            item.text = textField.text!
            item.shouldRemind = shouldRemindSwitch.isOn
            item.dueDate = dueDate
            delegate?.itemDetailViewController(self, didFinishEditing: item)
        } else{
            let item = CheckListItem(text: textField.text!, checked: false)
            item.shouldRemind = shouldRemindSwitch.isOn
            item.dueDate = dueDate
            delegate?.itemDetailViewController(self, didFinishAdding: item)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .never
        
        //конструкция, которая не выполнится, если itemToEdit = nil
        if let shadowItemToEdit = itemToEdit{
            self.title = "Edit Item"
            textField.text = shadowItemToEdit.text
            doneButton.isEnabled = true
            shouldRemindSwitch.isOn = shadowItemToEdit.shouldRemind
            dueDate = shadowItemToEdit.dueDate
        }
        updateDueDateLabel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        textField.becomeFirstResponder()
    }
    
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        if indexPath.section == 1 && indexPath.row == 1 {
            return indexPath
        } else {
            return nil
        }
    }
    
    override func tableView(_ tableView: UITableView, indentationLevelForRowAt indexPath: IndexPath) -> Int {
        var newIndexPath = indexPath
        if indexPath.section == 1 && indexPath.row == 2 {
            newIndexPath = IndexPath(row: 0, section: indexPath.section)
        }
        return super.tableView(tableView, indentationLevelForRowAt: newIndexPath)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        if indexPath.section == 1 && indexPath.row == 2 {
            print("TOST")
            return datePickerCell
        } else {
            print("TOST2")
            return super.tableView(tableView, cellForRowAt: indexPath)
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 1 && datePickerVisible{
            return 3
        } else {
            return super.tableView(tableView, numberOfRowsInSection: section)
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 1 && indexPath.row == 2 {
            return 2017
        } else {
            return super.tableView(tableView, heightForRowAt: indexPath)
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let oldText = textField.text!
        let stringRange = Range(range, in: oldText)!
        let newText = oldText.replacingCharacters(in: stringRange, with: string)
        if newText.isEmpty {
            doneButton.isEnabled = false
        }   else{
            doneButton.isEnabled = true
        }
        return true
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        textField.resignFirstResponder()
        if indexPath.section == 1 && indexPath.row == 1{
            showDatePicker()
            print("NOGA99")
        }
    }
    
    func updateDueDateLabel(){
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        dueDateLabel.text = formatter.string(from: dueDate)
    }
    
    func showDatePicker(){
        datePickerVisible = true
        
        let indexPathDateRow = IndexPath(row: 1, section: 1)
        let indexPathDatePicker = IndexPath(row: 2, section: 1)
        
        if let dateCell = tableView.cellForRow(at: indexPathDateRow){
            dateCell.detailTextLabel!.textColor = dateCell.detailTextLabel?.tintColor
        }
        
        tableView.beginUpdates()
        tableView.insertRows(at: [indexPathDatePicker], with: .fade)
        tableView.reloadRows(at: [indexPathDateRow], with: .none)
        tableView.endUpdates()
        
        datePicker.setDate(dueDate, animated: true)

    }
}
