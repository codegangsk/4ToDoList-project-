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
    
    var isPickerHidden: Bool = true
    
    let dateLableIndexPath = IndexPath(row: 0, section: 1)
    let datePickerIndexPath = IndexPath(row: 1, section: 1)
    let notesTextViewIndexPath = IndexPath(row: 0, section: 2)
    
    let normalCellHeight: CGFloat = 44
    let enlargedCellHeight: CGFloat = 200
    
    var toDo: ToDo? {
        didSet {
            print("\(toDo!)")
        }
    }
}

extension ToDoTableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        if let toDo = toDo {
            navigationItem.title = "To-Do"
            titleTextField.text = toDo.title
            isCompleteButton.isSelected = toDo.isComplete
            dueDatePickerView.date = toDo.dueDate
            notesTextView.text = toDo.notes
        } else {
            dueDatePickerView.date = Date().addingTimeInterval(24*60*60)
        }
        updateDueDateLable(date: dueDatePickerView.date)
        updateSaveButtonState()
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

extension ToDoTableViewController {
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath {
        case datePickerIndexPath:
            return isPickerHidden ? 0 : dueDatePickerView.frame.height
        case notesTextViewIndexPath:
            return enlargedCellHeight
        default:
            return normalCellHeight
        }
    }
}

extension ToDoTableViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath == dateLableIndexPath {
            isPickerHidden = !isPickerHidden
            dueDateLabel.textColor = isPickerHidden ? .black: tableView.tintColor
            tableView.beginUpdates()
            tableView.endUpdates()
        }
    }
}

extension ToDoTableViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        guard segue.identifier == "SaveUnwind" else { return }
        
        let title = titleTextField.text!
        let isComplete = isCompleteButton.isSelected
        let dueDate = dueDatePickerView.date
        let notes = notesTextView.text
        
        toDo = ToDo(title: title, isComplete: isComplete, dueDate: dueDate, notes: notes)
    }
}


 
