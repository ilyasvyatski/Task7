//
//  RecordVCExtensions.swift
//  Task7
//
//  Created by neoviso on 9/14/22.
//

import Foundation
import UIKit
import CoreData

extension TableViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        guard let sections = recordDataProvider.fetchedResultController.sections else { return 0 }
        return sections.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let sections = recordDataProvider.fetchedResultController.sections else { return 0 }
        return sections[section].numberOfObjects
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let record = recordDataProvider.fetchedResultController.object(at: indexPath)
        cell.textLabel?.text = record.title
        cell.detailTextLabel?.text = "\(String(record.children?.count ?? 0)) child"
        return cell
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        true
    }
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { (action, view, completionHandler) in
            let record = self.recordDataProvider.fetchedResultController.object(at: indexPath)
            guard !record.children!.isEmpty else {
                self.deleteRecordAlert(with: "Delete Record", "Are you sure you want to delete \(record.title ?? "name") record?", "Delete", "Cancel") {
                    self.recordDataProvider.fetchedResultController.managedObjectContext.delete(record)
                }
                return
            }
            self.deleteRecordAlert(with: "Delete Record", "Are you sure you want to delete \(record.title ?? "name") record with \(String(record.children?.count ?? 0)) child records?", "Delete", "Cancel") {
                self.recordDataProvider.fetchedResultController.managedObjectContext.delete(record)
            }
            completionHandler(true)
        }
        deleteAction.backgroundColor = .systemRed
        
        let editAction = UIContextualAction(style: .destructive, title: "Edit") { (action, view, completionHandler) in
            let record = self.recordDataProvider.fetchedResultController.object(at: indexPath)
            self.editRecordAlert(with: "Edit Record", "", "Edit", "Cancel", "Enter here", record.title ?? "record") { text in
                record.title = text
            }
            completionHandler(true)
        }
        editAction.backgroundColor = .systemGreen
        
        return UISwipeActionsConfiguration(actions: [deleteAction, editAction])
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if let vc = self.storyboard?.instantiateViewController(identifier: "recordViewController") as? TableViewController {
            vc.selectedRecord = self.recordDataProvider.fetchedResultController.object(at: indexPath)
            guard vc.selectedRecord != nil else { vc.currentPredicate = NSPredicate(format: "parent == %@", 0); return }
            vc.currentPredicate = NSPredicate(format: "parent == %@", vc.selectedRecord!)
            self.show(vc, sender: self)
        }
    }
}

extension TableViewController: NSFetchedResultsControllerDelegate {
    
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        self.tableView.beginUpdates()
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        switch type {
        case .insert:
            if let indexPath = newIndexPath {
                tableView.insertRows(at: [indexPath], with: .automatic)
            }
        case .update:
            if let indexPath = indexPath {
                /*let record = recordDataProvider.fetchedResultController.object(at: indexPath)//.convertToRecord()
                let cell = tableView.cellForRow(at: indexPath)
                cell?.textLabel?.text = record.title*/
                tableView.reloadRows(at: [indexPath], with: .automatic)
            }
        case .move:
            if let indexPath = indexPath {
                tableView.deleteRows(at: [indexPath], with: .automatic)
            }
            if let newIndexPath = newIndexPath {
                tableView.insertRows(at: [newIndexPath], with: .automatic)
            }
        case .delete:
            if let indexPath = indexPath {
                tableView.deleteRows(at: [indexPath], with: .automatic)
            }
        default:
            break
        }
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        self.tableView.endUpdates()
    }
}
