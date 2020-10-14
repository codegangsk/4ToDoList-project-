//
//  ToDosTableViewController.swift
//  4ToDoList-project-
//
//  Created by Sophie Kim on 2020/10/14.
//

import UIKit

class ToDosTableViewController: UITableViewController {
    var todos = [ToDo]()
}

extension ToDosTableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension ToDosTableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todos.count
    }
}
