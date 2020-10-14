//
//  ToDosTableViewController.swift
//  4ToDoList-project-
//
//  Created by Sophie Kim on 2020/10/14.
//

import UIKit

class ToDosTableViewController: UITableViewController {
    var toDos = [ToDo]()
}

extension ToDosTableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension ToDosTableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDos.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoCell", for: indexPath)
        let toDo = toDos[indexPath.row]
        cell.textLabel?.text = toDo.title
        return cell
    }
}
