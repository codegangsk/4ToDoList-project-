//
//  ToDoCell.swift
//  4ToDoList-project-
//
//  Created by Sophie Kim on 2020/10/19.
//

import UIKit

protocol ToDoCellDelegate: class {
    func checkmarkTapped(sender: ToDoCell)
}

class ToDoCell: UITableViewCell {
    weak var delegate: ToDoCellDelegate?
    
    @IBOutlet weak var isCompleteButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBAction func isCompleteButtonTapped(_ sender: UIButton) {
        delegate?.checkmarkTapped(sender: self)
    }
    
    
}
