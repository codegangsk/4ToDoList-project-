//
//  ToDoTableViewController.swift
//  4ToDoList-project-
//
//  Created by Sophie Kim on 2020/10/15.
//

import UIKit

class ToDoTableViewController: UITableViewController {
    @IBOutlet var isCompleteButton: UIButton!
    @IBOutlet var titleTextField: UITextField!
    @IBOutlet var dueDateLabel: UILabel!
    @IBOutlet var dueDatePickerView: UIDatePicker!
    @IBOutlet var notesTextView: UITextView!
}

extension ToDoTableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

 
