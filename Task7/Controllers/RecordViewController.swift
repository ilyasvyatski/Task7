//
//  TableViewController.swift
//  Task7
//
//  Created by neoviso on 9/10/22.
//

import UIKit
import CoreData

class TableViewController: UITableViewController {
    
    var currentPredicate = NSPredicate(format: "parent == %@", 0)
    var selectedRecord: RecordEntity?
    
    lazy var recordDataProvider: RecordProvider = {
        let dataProvider = RecordProvider(with: self)
        //dataProvider.fetchedResultController.fetchRequest.predicate = NSPredicate(format: "parent == %@", 0)
        dataProvider.fetchedResultController.fetchRequest.predicate = currentPredicate
        try? dataProvider.fetchedResultController.performFetch()
        return dataProvider
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = selectedRecord?.title ?? "Records"
        self.tableView.tableFooterView = UIView()
    }
    
    @IBAction func addNewRecordButton(_ sender: UIBarButtonItem) {
        createRecordAlert(with: "Add New Record", "", "Add", "Cancel", "Enter here", records: recordDataProvider.fetchedResultController.fetchedObjects) { text in
            /*guard self.selectedRecord == nil else { self.recordDataProvider.createChildRecord(parentRecord: self.selectedRecord, childTitle: text); return}
            self.recordDataProvider.createRecord(title: text)*/
            
            self.recordDataProvider.addRecord(parentRecord: self.selectedRecord, title: text)
        }
    }
}

