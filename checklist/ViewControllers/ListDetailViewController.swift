//
//  ListDetailViewController.swift
//  checklist
//
//  Created by i.y.kozlov on 31/12/2018.
//  Copyright © 2018 i.y.kozlov. All rights reserved.
//

import UIKit

protocol ListDetailViewControllerDelegate: class {
    func listDetailViewControllerDidCancel(_ controller: ListDetailViewController)
    func listDetailViewController(_ controller: ListDetailViewController, didFinishAdding checklist: Checklist)
    func listDetailViewController(_ controller: ListDetailViewController, didFinishEditing checklist: Checklist)
}

class ListDetailViewController: UITableViewController, UITextFieldDelegate, IconPickerViewControllerDelegate{
    
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var doneButton: UIBarButtonItem!
    weak var delegate: ListDetailViewControllerDelegate?
    var checkListToEdit : Checklist?
    var iconName = "loupe"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .never
        
        if let checklist = checkListToEdit{
            self.title = "Edit checklist"
            textField.text = checklist.name
            iconName = checklist.iconName
            doneButton.isEnabled = true
        }
        iconImageView.image = UIImage(named: iconName)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        textField.becomeFirstResponder()
    }
    
    // MARK: - Actions
    @IBAction func cancel(){
        delegate?.listDetailViewControllerDidCancel(self)
    }
    
    @IBAction func done(){
        if let checklist = checkListToEdit {
            checkListToEdit?.name = textField.text!
            delegate?.listDetailViewController(self, didFinishEditing: checklist)
            checklist.iconName = iconName
        } else{
            let checklist = Checklist(checklistName: textField.text!, chelistIcon: iconName)
            delegate?.listDetailViewController(self, didFinishAdding: checklist)
        }
    }
    
    // MARK: - TableView delegates
    
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        if indexPath.section==1 {
            return indexPath
        } else{
            return nil
        }
    }
    
    // MARK: - IconPicker delegates

    func iconPicker(_ picker: IconPickerViewController, didPick iconName: String) {
        self.iconName = iconName
        iconImageView.image = UIImage(named: iconName)
        navigationController?.popViewController(animated: true)
    }
    
    
    // MARK: - UITextFiled delegates
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let oldText = textField.text!
        let stringRange = Range(range, in: oldText)!
        let newText = oldText.replacingCharacters(in: stringRange, with: string)
        if newText.isEmpty {
            doneButton.isEnabled = false
        }   else{
            doneButton.isEnabled=true
        }
        return true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "PickIcon"{
            let controller = segue.destination as! IconPickerViewController
            controller.delegate = self
        }
    }
}
