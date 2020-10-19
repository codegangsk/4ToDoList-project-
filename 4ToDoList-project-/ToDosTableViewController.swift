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
        navigationItem.leftBarButtonItem = editButtonItem
        
        if let savedToDos = ToDo.loadToDos() {
            toDos = savedToDos
        } else {
            toDos = ToDo.loadSampleToDos()
        }
    }
}

extension ToDosTableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDos.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoCell") as? ToDoCell else {
            fatalError("Could not dequeue a cell")
        }
        let toDo = toDos[indexPath.row]
        cell.textLabel?.text = toDo.title
        return cell
    }
}

extension ToDosTableViewController {
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            toDos.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}

extension ToDosTableViewController {
    @IBAction func unwindToToDos(segue: UIStoryboardSegue) {
        guard segue.identifier == "SaveUnwind" else { return }
        let sourceViewController = segue.source as! ToDoTableViewController
        
        if let toDo = sourceViewController.toDo {
            if let selectedIndexPath = tableView.indexPathForSelectedRow {
                toDos[selectedIndexPath.row] = toDo
                tableView.reloadRows(at: [selectedIndexPath], with: .none)
            } else {
                let newIndexPath = IndexPath(row: toDos.count, section: 0)
                toDos.append(toDo)
                tableView.insertRows(at: [newIndexPath], with: .automatic)
        }
    }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "EditToDo" {
            let indexPath = tableView.indexPathForSelectedRow!
            let toDoTableViewController = segue.destination as! ToDoTableViewController
            let selectedToDo = toDos[indexPath.row]
            toDoTableViewController.toDo = selectedToDo
        }
    }
}
