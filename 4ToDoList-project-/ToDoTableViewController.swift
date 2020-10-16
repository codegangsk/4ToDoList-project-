//
//  ToDoTableViewController.swift
//  4ToDoList-project-
//
//  Created by Sophie Kim on 2020/10/15.
//

import UIKit

class ToDoTableViewController: UITableViewController {
    
    @IBOutlet var saveButton: UIBarButtonItem!
    
    @IBOutlet var isCompleteButton: UIButton!
    @IBOutlet var titleTextField: UITextField!
    @IBOutlet var dueDateLabel: UILabel!
    @IBOutlet var dueDatePickerView: UIDatePicker!
    @IBOutlet var notesTextView: UITextView!
}

extension ToDoTableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        updateSaveButtonState()
        updateDueDateLable(date: dueDatePickerView.date)
    }
}

extension ToDoTableViewController {
    func updateSaveButtonState() {
        let text = titleTextField.text ?? ""
        saveButton.isEnabled = !text.isEmpty
    }
    
    func updateDueDateLable(date: Date) {
        dueDateLabel.text = ToDo.dueDateFormatter.string(from: date)
    }
}

extension ToDoTableViewController {
    @IBAction func titleTextFieldEditingChanged(_ sender: Any) {
        updateSaveButtonState()
    }
    
    @IBAction func datePickerChanged(_ sender: UIDatePicker) {
        updateDueDateLable(date: dueDatePickerView.date)
    }
    
}

extension ToDoTableViewController {
    @IBAction func isCompleteButtonTapped(_ sender: UIButton) {
        isCompleteButton.isSelected = !isCompleteButton.isSelected
    }
    
    @IBAction func keyboardReturnPressed(_ sender: UITextField) {
        titleTextField.resignFirstResponder()
    }
}


 
